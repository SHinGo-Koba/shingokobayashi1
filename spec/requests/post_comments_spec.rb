require 'rails_helper'

RSpec.describe "PostComments", type: :request do
  include LoginSupport
  let!(:user){ FactoryBot.create(:user) }
  let(:post1){ FactoryBot.create(:post, user_id: user.id) }
  describe "it works" do
    it "works successfully" do
      post_login_as(user, "1")
      expect do
        post post_comments_path(post_id: post1.id),
          params: { 
            comment: { comment: "test"}
          },
          xhr: true 
      end.to change(Comment, :count).by(1)
      expect(response).to have_http_status(200)
    end
  end
  
  describe "it dosen't work" do
    it "because of no post" do
      post_login_as(user, "1")
      follow_redirect!
      expect(response.body).to include("Login successfully")
      expect do
        post post_comments_path(post_id: "100"),
          params: {
            comment: { comment: "test" }
          },
          xhr: true
      end.not_to change(Comment, :count)
      expect(request.flash[:notice]).to include("That post couldn't be found")
    end
    
    it "because of no login" do
      post post_comments_path(post_id: post1.id),
        params: {
          comment: { comment: "test" }
        },
        xhr: true
      expect(response).to redirect_to login_path
      expect(request.flash[:notice]).to include("Please login")
    end
    
  end

end
