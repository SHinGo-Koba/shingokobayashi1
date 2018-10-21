require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  include LoginSupport
  let!(:user1){ FactoryBot.create(:user) }
  let!(:user2){ FactoryBot.create(:user) }

  scenario "Login" do
    page.driver.submit :get, root_path, {}
    # visit root_path
    find("div.header-pc").find_link("Login").click
    expect(page).to have_text "Welcome, Login"
    
    click_button "Login"
    expect(page).to have_text "Invalid name/password"
    
    # fill_in "User Name", with: "#{user2.name}"
    # fill_in "Password", with: "#{user2.password}"
    # click_button "Login"
    
    login_as(user2, true)
    expect(page).to have_text "Login successfully"
    puts "#{user2.inspect}"
    expect(user2.reload.remember_digest).to_not be_nil
    puts "#{user2.inspect}"
    
    find("div.header-pc").find_link("Logout").click
    expect(page).to have_text "Logout successfully"
    puts "#{user2.inspect}"
    expect(user2.reload.remember_digest).to be_nil
    puts "#{user2.inspect}"
    
    page.driver.submit :delete, logout_path, {}
    expect(page).to have_text "Already Logouted"
    
  end
end
