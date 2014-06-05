require 'spec_helper'
include ApiHelpers

describe "API::V1" do
  before(:each) { host! "api.#{host}" }
  let!(:moment)  { create(:moment) }

  describe "GET /moments" do
    it "should return an array of all moments" do
      get lapse_moments_path(moment.lapse)
      expect(response.code.to_i).to eq 200
      expect(json_response).to eq([{
        "moment" => {
          "id"      => moment.id,
          "active"  => moment.active
        }
      }])
    end
  end

  describe "GET /moment/:id" do
    it "should return a moment by id" do
      get moment_path(moment)
      expect(response.code.to_i).to eq 200
      expect(json_response).to eq({
        "moment" => {
          "id"      => moment.id,
          "active"  => moment.active
        }
      })
    end

    it "should return a 404 error if id is not found" do
      get moment_path(-1)
      expect(response.code.to_i).to eq 404
      expect(json_response).to eq({
        "error" => "The requested resource could not be found."
      })
    end
  end

  describe "POST /moments" do
    it "should create and return a moment" do
      post "lapses/#{moment.lapse.id}/moments", {
        active: true
      }.to_json, { 'Content-Type' => 'application/json' }
      moment = Moment.last
      expect(response.code.to_i).to eq 201
      expect(json_response).to eq({
        "moment" => {
          "id"      => moment.id,
          "active"  => moment.active
        }
      })
    end

    it "should return an error message when invalid" do
      post "lapses/#{moment.lapse.id}/moments", {
        active: ''
      }.to_json, { 'Content-Type' => 'application/json' }
      expect(response.code.to_i).to eq 422
      expect(json_response).to eq({
        "error" => ["Active can't be blank"]
      })
    end
  end

  describe "DELETE /moment/:id" do
    it "should remove moment" do
      delete moment_path(moment)
      expect(response.code.to_i).to eq 200
    end
    it "should return a 404 error if id is not found" do
      delete moment_path(-1)
      expect(response.code.to_i).to eq 404
      expect(json_response).to eq({
        "error" => "The requested resource could not be found."
      })
    end
  end
end
