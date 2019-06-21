FactoryBot.define do
  factory :comment do
    content "test comment."
    association :user
    association :micropost
  end
end
