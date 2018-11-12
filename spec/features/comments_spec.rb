require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  include LoginSupport
  let!(:user1){ FactoryBot.create(:user) }
  let(:post1){ FactoryBot.create(:post, user_id: user1.id) }
  let!(:user2){ FactoryBot.create(:user) }
  
  scenario "user comments on a post by another user" do
    expect {
      login_as(user2, false)
      find("div.header-pc").find_link("NOW!").click
      fill_in "comment on this post", with: "great!"
      click.button "Comment!"
      
      expect(page).to have_content "just commented"
    }.to change(Comment, :count).by(1)
  end
end
