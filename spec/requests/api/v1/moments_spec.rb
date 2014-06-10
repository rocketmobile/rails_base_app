require 'spec_helper'
include ApiHelpers

describe "API::V1::Moments" do
  before(:each) { host! "api.lvh.me" }
  let!(:moment)  { create(:moment) }

  describe "GET /moments" do
    it "returns an array of all moments" do
      get lapse_moments_path(moment.lapse)
      expect(json_response).to eq({
        "moments" => [{
          "id"      => moment.id,
          "active"  => moment.active
        }]
      })
    end
    it "returns a 200 status code" do
      get lapse_moments_path(moment.lapse)
      expect(response.code.to_i).to eq 200
    end
  end

  describe "GET /moment/:id" do
    context "with a valid id" do
      it "returns a moment by id" do
        get moment_path(moment)
        expect(json_response).to eq({
          "moment" => {
            "id"      => moment.id,
            "active"  => moment.active
          }
        })
      end
      it "returns a 200 status code" do
        get moment_path(moment)
        expect(response.code.to_i).to eq 200
      end
    end

    context "with an invalid id" do
      it "returns an error" do
        get moment_path(-1)
        expect(json_response).to eq({
          "errors" => "The requested resource could not be found."
        })
      end
      it "returns a 404 status code" do
        get moment_path(-1)
        expect(response.code.to_i).to eq 404
      end
    end
  end

  describe "POST /moments" do
    context "with valid parameters" do
      it "should create a moment" do
        expect{
          post "lapses/#{moment.lapse.id}/moments", {
            active: true
          }.to_json, { 'Content-Type' => 'application/json' }
        }.to change{Moment.count}.to Moment.count+1
      end
      it "returns a moment" do
        post "lapses/#{moment.lapse.id}/moments", {
          active: true
        }.to_json, { 'Content-Type' => 'application/json' }
        moment = Moment.last
        expect(json_response).to eq({
          "moment" => {
            "id"      => moment.id,
            "active"  => moment.active
          }
        })
      end
      it "returns a 201 status code" do
        post "lapses/#{moment.lapse.id}/moments", {
          active: true
        }.to_json, { 'Content-Type' => 'application/json' }
        expect(response.code.to_i).to eq 201
      end
    end

    context "with invalid parameters" do
      it "returns an error" do
        post "lapses/#{moment.lapse.id}/moments", {
          active: ''
        }.to_json, { 'Content-Type' => 'application/json' }
        expect(json_response).to eq({
          "errors" => [{
            "parameter" => "Active",
            "message"   => "Active can't be blank"
          }],
          "moment" => {
            "id"     => nil,
            "active" => nil
          }
        })
      end
      it "returns a 400 status code" do
        post "lapses/#{moment.lapse.id}/moments", {
          active: ''
        }.to_json, { 'Content-Type' => 'application/json' }
        expect(response.code.to_i).to eq 400
      end
    end
  end

  describe "DELETE /moment/:id" do
    context "with a valid id" do
      it "should remove moment" do
        expect{
          delete moment_path(moment)
        }.to change{Moment.count}.to Moment.count-1
      end
      it "returns a 200 status code" do
        delete moment_path(moment)
        expect(response.code.to_i).to eq 200
      end
    end
    context "with an invalid id" do
      it "returns an error" do
        delete moment_path(-1)
        expect(json_response).to eq({
          "errors" => "The requested resource could not be found."
        })
      end
      it "returns a 404 status code" do
        delete moment_path(-1)
        expect(response.code.to_i).to eq 404
      end
    end
  end
end
