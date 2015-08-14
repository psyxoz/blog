unless Rails.env.production?
  user = User.create(admin: true,
    email: 'admin@admin.com',
    password: 'password',
    password_confirmation: 'password'
  )

  10.times do |i|
    post = Post.create(
      title: "Test post №#{i}",
      content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    )
    3.times do |n|
      post.comments.create(
        content: "Something №#{n}",
        user: user
      )
    end
  end
end