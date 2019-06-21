FactoryBot.define do
  factory :micropost do
    content "test content."
    association :user
  end
end
