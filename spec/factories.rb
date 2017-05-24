FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "user#{n}" }
    password "1234"
    password_confirmation "1234"
  end

  factory :generator do
    table {}
  end
end
