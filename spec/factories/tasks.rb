FactoryBot.define do
  factory :task do
    association :list, factory: :list
    content_task  { Faker::Lorem.sentence(word_count: 10) }
    priority_task { 1 }
    deadline_task { "2018-06-19 01:47:57" }
    status        { :in_work }
  end
end
