require "spec_helper"

describe ApplicationController do
  describe "#redirect_to_back" do
    context "with a referrer" do
      let(:referrer){ 'http://example.com' }
      before(:each){ controller.request.stub referrer: referrer }

      it "calls redirect_to :back" do
        controller.should_receive(:redirect_to).with(:back, {})
        controller.send :redirect_to_back
      end
    end

    context "without a referrer" do
      it "falls back to opts[:or]" do
        controller.should_receive(:redirect_to).with('/test', {})
        controller.send(:redirect_to_back, or: '/test')
      end
      it "falls back to root_path" do
        controller.should_receive(:redirect_to).with(root_path, {})
        controller.send(:redirect_to_back)
      end
    end
  end
end