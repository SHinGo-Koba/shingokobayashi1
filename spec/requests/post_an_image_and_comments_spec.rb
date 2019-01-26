require 'rails_helper'

RSpec.describe "PostAnImageAndComments", type: :request do
  include LoginSupport
  include ActionDispatch::TestProcess::FixtureFile

  describe "GET /post_an_image_and_comments" do
    let!(:user1){ FactoryBot.create(:user) }
    let!(:user2){ FactoryBot.create(:user) }

    it "works! (now write some real specs)" do
      post_login_as(user1, 1)
      follow_redirect!
      expect(response.body).to include("Login successfully")
      expect do
        post posts_path,
          params: {
            post: {
              content: "test",
              post_image: fixture_file_upload("0989752.jpg", "image/jpg")
            }
          }
      end.to change(Post, :count).by(1)
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response.body).to include("just posted!")
    end
    
    it "works for deleting post including comments" do
      post_login_as(user1, 1)
      follow_redirect!
      expect(response.body).to include("Login successfully")
      expect do
        post posts_path,
          params: {
            post: {
              content: "test",
              post_image: fixture_file_upload("0989752.jpg", "image/jpg")
            }
          }
      end.to change(Post, :count).by(1)
      
      expect(File).to exist("#{Rails.root}/public#{user1.posts.first.post_image.url}")
      before_url = Marshal.load(Marshal.dump(user1.posts.first.post_image.url))
      delete logout_path
      follow_redirect!
      expect(response.body).to include("Logout successfully")
      
      post_login_as(user2, 1)
      follow_redirect!
      expect(response.body).to include("Login successfully")
      
      expect(Comment.count).to eq(0)
      expect do
        post post_comments_path(user1.posts.first.id),
          params: { comment: { comment: "good" } },
          xhr: true
      end.to change(Comment, :count).by(1)
      delete logout_path
      follow_redirect!
      expect(response.body).to include("Logout successfully")

      post_login_as(user1, 1)
      follow_redirect!
      expect(response.body).to include("Login successfully")
      expect do
        delete post_path(user1.posts.first.id)
      end.to change(Comment, :count).by(-1)
      expect(user1.reload.posts.count).to eq(0)
      expect(File).not_to exist("#{Rails.root}/public#{before_url}")
      
    end
  end
end
