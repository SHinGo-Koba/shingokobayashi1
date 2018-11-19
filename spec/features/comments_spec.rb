require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  include LoginSupport
  let!(:user1){ FactoryBot.create(:user) }
  let!(:post1){ FactoryBot.create(:post, user_id: user1.id) }
  let!(:user2){ FactoryBot.create(:user) }
  
  scenario "user comments on a post by another user" do
    expect {
      login_as(user2, false)
      find("div.header-pc").find_link("NOW!").click
      find("div.posts-each").find_link("test1").click
      expect(page).to have_current_path post_path(1)
      
      fill_in "comment[comment]", with: "great!"
      click_button "Comment!"
      
      expect(page).to have_content "Commented!"
      
    }.to change(Comment, :count).by(1)
    expect(page).to have_current_path post_path(1)
    expect(page.body).to include("great!")
  end
end
