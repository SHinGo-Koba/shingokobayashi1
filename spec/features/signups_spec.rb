require 'rails_helper'

RSpec.feature "Signups", type: :feature do
  scenario "visit signup page and register" do
    expect {
      visit root_path
      find("div.header-pc").find_link("Signup").click
      expect()
    }
  end

end
