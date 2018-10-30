require 'rails_helper'

RSpec.describe Comment, type: :model do
  include LoginSupport
  let(:user) { factoryBot.create(:user) }
  
  describe "create a comment" do
    context "when a comment is invalid" do
      it "because of no any information" do
        expect(Comment.create()).to be_invalid
      end
      
      it "because of lack of comment" do
        expect(Comment.create(
          user_id: "1",
          post_id: "1",
          )
        ).to be_invalid
      end
      
      it "because of over limit of characters limitation" do
        expect(Comment.create(
          user_id: "1",
          post_id: "1",
          comment: "#{"a" * 141}")
        ).to be_invalid
      end
      
    end
  end
  
end
