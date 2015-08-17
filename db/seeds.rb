unless Rails.env.production?
  require 'factory_girl_rails'

  user = FactoryGirl.create(:admin_user, email: 'admin@admin.com')

  FactoryGirl.create_list(:post, 10).each do |post|
    3.times do |n|
      FactoryGirl.create(:comment, post: post, user: user, content: "some comment №#{n}")
    end
  end
end