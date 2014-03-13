require "spec_helper"

describe StaticPaths do
  describe "#directory_url" do
    it "ends in static" do
      StaticPaths.directory_url.should =~ /static\z/
    end
  end
  describe "#url_for" do
    it "returns an asset path relative to the asset_host in a static directory" do
      StaticPaths.url_for('test.asset').should == "#{Rails.application.config.action_controller.asset_host}/static/test.asset"
    end
    it "ignores extra leading /'s" do
      StaticPaths.url_for('/test.asset').should == StaticPaths.url_for('test.asset')
    end
  end
  describe "an unknown url method" do
    context "when it ends in _url" do
      it "calls url_for with the method _url prefix as a prefixed, pluralized directory" do
        StaticPaths.should_receive(:url_for).with('avatars/test.asset', {})

        StaticPaths.avatar_url('test.asset')
      end
    end
  end
end