require 'rails_helper'

RSpec.describe "Signups", type: :request do
  describe "GET /signup" do
    it "works! (now write some real specs)" do
      get signup_path
      expect(response).to have_http_status(200)
    end
  end
  
  describe "POST /signup" do
    it "works with valid data" do
      expect {
        post signup_path, params: {user: {
          name: "user1",
          email: "user1@example.com",
          email_confirmation: "user1@example.com",
          password: "user1user1",
          password_confirmation: "user1user1"
          }
        }
      }.to change(User, :count).by(1)
      
      expect(response).to have_http_status(:success)
    end
  end
end
