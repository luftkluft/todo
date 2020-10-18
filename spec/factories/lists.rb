FactoryBot.define do
  factory :list do
    title_list    { Faker::Lorem.sentence(word_count: 5) }
    priority_list { 1 }
    deadline_list { "2018-06-19 01:43:25" }
    status        { "new" }
  end
end
