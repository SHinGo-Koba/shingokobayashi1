require 'rails_helper'

RSpec.describe "GetPostsIndices", type: :request do
  describe "GET /get_posts_indices" do
    let!(:user){ FactoryBot.create(:user) }
    let!(:post1){ FactoryBot.create(:post, user_id: user.id ) }
    let!(:post2){ FactoryBot.create(:post, user_id: user.id ) }

    it "works! (with get posts_path)" do
      get posts_path
      puts "This is inspection for a user of post1 #{post1.user.inspect}"
      puts "This is inspection for a user of post2 #{post2.user.posts.inspect}"

      expect(response).to have_http_status(200)
    end
    
    it "works! (with get post_path)" do
      get post_path(post1)
      puts "This is inspection for a user #{post1.user.inspect}"
      puts "This is inspection for posts #{post1.user.posts.inspect}"
      expect(response).to have_http_status(200)
    end
    
    it "works! (with get user_path)" do
      get user_path(user)
      puts "This is inspection for a user #{user.inspect}"
      puts "This is inspection for posts #{user.posts.inspect}"
      expect(response).to have_http_status(200)
    end

  end
end
