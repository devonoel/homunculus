FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "user#{n}" }
    password "1234"
    password_confirmation "1234"
  end

  factory :generator do
    sequence(:name) {|n| "generator#{n}"}
    seed ["foo", "bar", "baz"]
    table {}
  end
end
