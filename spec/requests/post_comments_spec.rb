require 'rails_helper'

RSpec.describe "PostComments", type: :request do
  include LoginSupport
  let!(:user){ FactoryBot.create(:user) }
  describe "GET /post_comments" do
    it "works! (now write some real specs)" do
      post_login_as(user, "1")
      post post_comments_path(post_id: "1"), comment: {
        post_id: "1",
        comment: "test",
        }
      expect(response).to redirect_to post_path(id: "1")
      follow_redirect!
      expect(response).to have_http_status(200)
    end
  end
end
