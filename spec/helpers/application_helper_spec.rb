require "spec_helper"

describe ApplicationHelper do
  describe "#link_to_back" do
    context "with a referrer" do
      let(:referrer){ 'http://example.com' }
      before(:each){ controller.request.stub referrer: referrer }

      it "passes referrer to link_to" do
        helper.should_receive(:link_to).with('link title', referrer, {})

        helper.link_to_back 'link title'
      end
    end
    context "without a referrer" do
      it "falls back to root_path" do
        helper.should_receive(:link_to).with('link title', root_path, {})

        helper.link_to_back 'link title'
      end
      it "falls back to opts[:or]" do
        helper.should_receive(:link_to).with('link title', '/test', {})

        helper.link_to_back 'link title', or: '/test'
      end
    end
  end
end