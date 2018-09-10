require 'rails_helper'

RSpec.describe "Signups", type: :request do
  describe "GET /signup" do
    it "works! (now write some real specs)" do
      get signup_path
      expect(response).to render_template "users/new"
    end
  end
  
  describe "POST /signup" do
    # FactoryBot.create(:user)
    it "works with valid data" do
      # user_params = FactoryBot.attributes_for(:user)
      get signup_path
      expect {
        post signup_path, { user: {
          name: "user10",
          email: "user10@example.com",
          email_confirmation: "user10@example.com",
          password: "user102018",
          password_confirmation: "user102018",
          } 
        }
        expect(response).to redirect_to "/posts"
        follow_redirect!
        # expect(response.body).to include("piyopiyo something wrong")
      }.to change(User, :count).by(1)
      expect(response).to render_template "posts/index"      
    end
  end
end
