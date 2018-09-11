require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  include LoginSupport
  let(:user) { FactoryBot.create(:user) }
  
  scenario "user posts with a valid file" do
    expect {
      login_as user
      find("div.header-pc").find_link("Tweet").click
      fill_in "Content", with: "test1"
      attach_file "Attached image", "#{Rails.root}/spec/files/validTestPhoto.JPG"
      click_button "Tweet!"
      
      expect(page).to have_content "just posted!"
    }.to change(Post, :count).by(1)
  end
  
  scenario "user posts with an invalid data type file" do
    expect {
      login_as user
      find("div.header-pc").find_link("Tweet").click
      fill_in "Content", with: "test2"
      attach_file "Attached image", "#{Rails.root}/spec/files/invalidFile.txt"
      click_button "Tweet!"
      
      expect(page).to have_content "Failed..."
    }.not_to change(Post, :count)
  end

  scenario "user posts with an invalid excessive data file" do
    expect {
      login_as user
      find("div.header-pc").find_link("Tweet").click
      fill_in "Content", with: "test3"
      attach_file "Attached image", "#{Rails.root}/spec/files/invalidExcessiveFile.jpg"
      click_button "Tweet!"
      
      expect(page).to have_content "Failed..."
    }.not_to change(Post, :count)
  end
  
end
