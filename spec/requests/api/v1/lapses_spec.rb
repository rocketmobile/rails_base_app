require 'spec_helper'
include ApiHelpers

describe "API::V1" do
  before(:each) { host! "api.#{host}" }
  let!(:lapse)  { create(:lapse) }

  describe "GET /lapses" do
    it "should return an array of all lapses" do
      get lapses_path
      expect(response.code.to_i).to eq 200
      expect(json_response).to eq([{
        'lapse' => {
          'id'    => lapse.id,
          'name'  => lapse.name
        }
      }])
    end
  end

  describe "GET /lapse/:id" do
    it "should return a lapse by id" do
      get lapse_path(lapse)
      expect(response.code.to_i).to eq 200
      expect(json_response).to eq({ "lapse"=>{"id"=>lapse.id, "name"=>lapse.name} })
    end
    it "should return a 404 error if id is not found" do
      get lapse_path(-1)
      expect(response.code.to_i).to eq 404
      expect(json_response).to eq({ "error" => "The requested resource could not be found." })
    end
  end

  describe "POST /lapses" do
    it "should create and return a lapse" do
      post '/lapses', {
        name: 'My Lapse'
      }.to_json, { 'Content-Type' => 'application/json' }
      lapse = Lapse.last
      expect(json_response).to eq({ "lapse"=>{"id"=>lapse.id, "name"=>lapse.name} })
      expect(response.code.to_i).to eq 201
    end
    it "should return an error message when invalid" do
      post '/lapses', {
        name: ''
      }.to_json, { 'Content-Type' => 'application/json' }
      expect(json_response).to eq({ "error"=>["Name can't be blank"] })
      expect(response.code.to_i).to eq 422
    end
  end

  describe "PATCH /lapse/:id" do
    it "should create and return a lapse" do
      patch "/lapses/#{lapse.id}", {
        name: 'My Lapse'
      }.to_json, { 'Content-Type' => 'application/json' }
      expect(json_response).to eq({ "lapse"=>{"id"=>lapse.reload.id, "name"=>lapse.reload.name} })
      expect(response.code.to_i).to eq 200
    end
    it "should return an error message when invalid" do
      patch "/lapses/#{lapse.id}", {
        name: ''
      }.to_json, { 'Content-Type' => 'application/json' }
      expect(json_response).to eq({ "error"=>["Name can't be blank"] })
      expect(response.code.to_i).to eq 422
    end
  end

  describe "DELETE /lapse/:id" do
    it "should remove lapse" do
      delete lapse_path(lapse)
      expect(response.code.to_i).to eq 200
    end
    it "should return a 404 error if id is not found" do
      delete lapse_path(-1)
      expect(response.code.to_i).to eq 404
      expect(json_response).to eq({ "error" => "The requested resource could not be found." })
    end
  end
end
