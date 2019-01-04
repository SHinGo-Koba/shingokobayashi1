require 'rails_helper'

RSpec.describe "UserImageUploads", type: :request do
  include LoginSupport
  include ActionDispatch::TestProcess::FixtureFile
  let!(:user){ FactoryBot.create(:user) }

  describe "POST /user_image_uploads" do
    it "works with user_image" do
      post_login_as(user, "1") 
      follow_redirect!
      expect(response.body).to include("Login successfully")
      expect(user.user_image.url).to be_blank
      
      patch user_path(user),
        params: {
          user_image: fixture_file_upload("0989752.jpg")
        }
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(200)
      
      expect(user.reload.user_image.url).not_to be_blank
    end
  end
end
