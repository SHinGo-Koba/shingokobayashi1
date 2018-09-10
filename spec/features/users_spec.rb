require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "sign up" do
    expect {
      visit root_path
      find("div.header-pc").find_link("Signup").click
      fill_in "Name", with: "user1"
      fill_in "Email", with: "user1@example.com"
      fill_in "Email confirmation", with: "user1@example.com"
      fill_in "Password", with: "user12018"
      fill_in "Password confirmation", with: "user12018"
      click_button "Signup"
  
      expect(page).to have_content "Welcome, user1!"  
    }.to change(User, :count).by(1)
  end
end
