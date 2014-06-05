require 'spec_helper'
include ApiHelpers

describe "API::V1" do
  before(:each) { host! "api.lvh.me" }
  let!(:lapse)  { create(:lapse) }

  describe "GET /lapses" do
    it "returns an array of all lapses" do
      get lapses_path
      expect(response.code.to_i).to eq 200
      expect(json_response).to eq([{
        "lapse" => {
          "id"    => lapse.id,
          "name"  => lapse.name
        }
      }])
    end
    it "returns a 200 status code" do
      get lapses_path
      expect(response.code.to_i).to eq 200
    end
  end

  describe "GET /lapse/:id" do
    context "with a valid id" do
      it "returns a lapse by id" do
        get lapse_path(lapse)
        expect(json_response).to eq({
          "lapse" => {
            "id"    => lapse.id,
            "name"  => lapse.name
          }
        })
      end
      it "returns a 200 status code" do
        get lapse_path(lapse)
        expect(response.code.to_i).to eq 200
      end
    end

    context "with an invalid id" do
      it "returns an error" do
        get lapse_path(-1)
        expect(json_response).to eq({
          "error" => "The requested resource could not be found."
        })
      end
      it "returns a 404 status code" do
        get lapse_path(-1)
        expect(response.code.to_i).to eq 404
      end
    end
  end

  describe "POST /lapses" do
    context "with valid parameters" do
      it "should create a lapse" do
        expect{
          post '/lapses', {
            name: 'My Lapse'
          }.to_json, { 'Content-Type' => 'application/json' }
        }.to change{Lapse.count}.to Lapse.count+1
      end
      it "returns a lapse" do
        post '/lapses', {
          name: 'My Lapse'
        }.to_json, { 'Content-Type' => 'application/json' }
        lapse = Lapse.last
        expect(json_response).to eq({
          "lapse" => {
            "id"    => lapse.id,
            "name"  => lapse.name
          }
        })
      end
      it "returns a 201 status code" do
        post '/lapses', {
          name: 'My Lapse'
        }.to_json, { 'Content-Type' => 'application/json' }
        expect(response.code.to_i).to eq 201
      end
    end

    context "with invalid parameters" do
      it "returns an error" do
        post '/lapses', {
          name: ''
        }.to_json, { 'Content-Type' => 'application/json' }
        expect(json_response).to eq({
          "error" => ["Name can't be blank"]
        })
      end
      it "returns a 422 status code" do
        post '/lapses', {
          name: ''
        }.to_json, { 'Content-Type' => 'application/json' }
        expect(response.code.to_i).to eq 422
      end
    end
  end

  describe "PATCH /lapse/:id" do
    context "with a valid id" do
      it "updates the lapse asscoiated with the id" do
        expect{
          patch "/lapses/#{lapse.id}", {
            name: 'My Lapse'
          }.to_json, { 'Content-Type' => 'application/json' }
        }.to change{lapse.reload.name}.to 'My Lapse'
      end
      it "returns a lapse" do
        patch "/lapses/#{lapse.id}", {
          name: 'My Lapse'
        }.to_json, { 'Content-Type' => 'application/json' }
        expect(json_response).to eq({
          "lapse" => {
            "id"    => lapse.reload.id,
            "name"  => lapse.reload.name
          }
        })
      end
      it "returns a 200 status code" do
        patch "/lapses/#{lapse.id}", {
          name: 'My Lapse'
        }.to_json, { 'Content-Type' => 'application/json' }
        expect(response.code.to_i).to eq 200
      end
    end

    context "with an invalid id" do
      it "returns an error" do
        patch "/lapses/#{lapse.id}", {
          name: ''
        }.to_json, { 'Content-Type' => 'application/json' }
        expect(json_response).to eq({
          "error" => ["Name can't be blank"]
        })
      end
      it "returns a 422 status code" do
        patch "/lapses/#{lapse.id}", {
          name: ''
        }.to_json, { 'Content-Type' => 'application/json' }
        expect(response.code.to_i).to eq 422
      end
    end
  end

  describe "DELETE /lapse/:id" do
    context "with a valid id" do
      it "should remove lapse" do
        expect{
          delete lapse_path(lapse)
        }.to change{Lapse.count}.to Lapse.count-1
      end
      it "returns a 200 status code" do
        delete lapse_path(lapse)
        expect(response.code.to_i).to eq 200
      end
    end
    context "with an invalid id" do
      it "returns an error" do
        delete lapse_path(-1)
        expect(json_response).to eq({
          "error" => "The requested resource could not be found."
        })
      end
      it "returns a 404 status code" do
        delete lapse_path(-1)
        expect(response.code.to_i).to eq 404
      end
    end
  end
end
