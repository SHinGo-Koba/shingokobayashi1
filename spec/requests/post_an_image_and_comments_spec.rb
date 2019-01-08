require 'rails_helper'

RSpec.describe "PostAnImageAndComments", type: :request do
  include LoginSupport
  include ActionDispatch::TestProcess::FixtureFile
  let!(:user){ FactoryBot.create(:user) }
  # file = File.open(File.join(Rails.root, "spec/files/validTestPhoto.JPG"))

  describe "GET /post_an_image_and_comments" do
    it "works! (now write some real specs)" do
      post_login_as(user, 1)
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
  end
end
