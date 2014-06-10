require 'spec_helper'

describe "Pages" do
  describe "Home" do
    xit "has homepage content" do
      visit root_path

      page.should have_content("We're Riding on Rails!")
    end
  end
end

