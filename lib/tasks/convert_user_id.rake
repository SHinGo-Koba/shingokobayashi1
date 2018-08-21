namespace :seed do
  desc "Convert user_id for posts"
  task :convert_user_id => :environment do
    Post.transaction do
      Post.all.each do |post|
        post.user_id = post.user_id_old.to_i
        post.save!
      end
    end
  end
end