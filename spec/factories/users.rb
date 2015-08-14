FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@test.com"
    end

    admin false
    password 'password'

    factory :admin_user do
      admin true
    end
  end
end
