require 'spec_helper'

describe "Api::V1::Lapses" do
  before(:each){ set_subdomain :api  }
  after(:each){ reset_host }

  describe "GET /lapses" do
    it "returns an a list of lapses" do
      get lapses_path
      response.status.should be(200)
    end
  end

  describe "GET /lapse/:id" do
    xit "returns the lapse specified by the id" do
    end
  end

  describe "POST /lapses" do
    xit "creates a new lapse" do
    end
  end

  describe "PATCH /lapse/:id" do
    xit "" do
    end
  end

  describe "DELETE /lapse/:id" do
    xit "" do
    end
  end
end
