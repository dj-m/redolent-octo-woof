FactoryGirl.define do
  factory :post do
    title { "My Thoughts" }
    author_name { "John Musing" }
    body { Faker::Lorem.paragraph(5) }
  end
end
