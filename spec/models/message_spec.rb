require 'spec_helper'

describe Message do
  describe "attributes" do
    it "acts like AR model" do
      message = Message.new({'to' => 'test'})
      message.to.should == 'test'
    end
    it "validates incorrect number" do
      message = Message.new(to: 'test', text: 'tester')

      message.should be_invalid
    end
  end
end