require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "create a post" do
    context "when a post is valid" do
      it "create a post with a post_image" do
        post = FactoryBot.build(:post)
    
        expect(post).to be_valid
      end
    
      it "create a post without any post_image" do
        post = FactoryBot.build(:post, post_image: nil)
      
        expect(post).to be_valid
      end
    end
    
    context "when a post is NOT valid" do
      it "create a post without a content" do
        post = FactoryBot.build(:post, content: nil)
        
        expect(post).to be_invalid
      end
      
      it "create a post without a invalid post_image" do
        post = FactoryBot.build(:post, post_image: nil)
        
        post.valid?
        expect(post.errors.any?).to eq false
      end
    end
  end
end
