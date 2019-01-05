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
        params: { user: {
          user_image: fixture_file_upload("0989752.jpg")
          }
        }
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response.body).to include("Change your image!")

      expect(user.reload.user_image.url).not_to be_blank
    end
    
    it "works when user image are updated" do
      post_login_as(user, "1") 
      follow_redirect!
      expect(user.reload.user_image.url).to be_blank
      patch user_path(user),
        params: { user: {
          user_image: fixture_file_upload("0989752.jpg")
          }
        }
      follow_redirect!
      expect(user.reload.user_image.url).not_to be_blank

      before_url = Marshal.load(Marshal.dump(user.user_image.url))
      
      patch user_path(user),
        params: { user: {
          user_image: fixture_file_upload("6298988.jpg")
          }
        }  
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response.body).to include("Change your image!")

      expect(user.reload.user_image.url).not_to eq(before_url)
      puts "before_url #{Rails.root}/public#{before_url}"
      puts "user.user_image.url #{Rails.root}/public#{user.user_image.url}"
      
      expect(File).not_to exist("#{Rails.root}/public#{before_url}")
      expect(File).to exist("#{Rails.root}/public#{user.user_image.url}")
      
    end
  end
end
