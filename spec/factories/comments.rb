FactoryGirl.define do
  factory :comment do
    user
    post
    content "Some sweet comments"
  end
end