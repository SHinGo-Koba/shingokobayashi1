require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST post_comments" do
    it "works! (with post post_comments)" do
      post :create, post_id: "1", comment: {
        post_id: "1",
        comment: "test",
        }
      expect(response).to render_template "posts/index"
    end
  end
end
