require 'rails_helper'

RSpec.describe Post, type: :model do
  include LoginSupport
  let(:user) { FactoryBot.create(:user) }
  
  describe "create a post" do
    context "when a post is valid" do
      it "create a post without a post_image" do
        post1 = user.posts.build(
          content: "test1!"
          )
        puts "#{post1.inspect}"
        puts "#{post1.user.inspect}"
        expect(post1).to be_valid
      end
      
      it "create a post with a post_image" do
        file = File.open(File.join(Rails.root, "spec/files/validTestPhoto.JPG"))
        post = user.posts.build(
          content: "test2!",
          post_image: file,
          )
        puts "#{post.inspect}"
        puts "#{post.user.inspect}"
        expect(post).to be_valid
      end
      
    end
    
    context "when a post is invalid" do
      it "create a post with excessive data of a post_image" do
        file = File.open(File.join(Rails.root, "spec/files/invalidExcessiveFile.jpg"))
        post = user.posts.build(
          content: "test3!",
          post_image: file,
          )
        puts "#{post.inspect}"
        puts "#{post.user.inspect}"
        expect(post).to be_invalid
      end

      it "create a post with invalid data type of a post_image" do
        file = File.open(File.join(Rails.root, "spec/files/invalidFile.txt"))
        post = user.posts.build(
          content: "test4!",
          post_image: file,
          )
        puts "#{post.inspect}"
        puts "#{post.user.inspect}"
        expect(post).to be_invalid
      end


    end
  end
end