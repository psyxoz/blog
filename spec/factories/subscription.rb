FactoryGirl.define do
  factory :subscription do
    sequence :email do |n|
      "user#{n}@test.com"
    end
  end
end