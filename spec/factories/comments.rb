FactoryBot.define do
  factory :comment do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    comment_text { Faker::Lorem.paragraphs(number: 2).join("\n") }

    # trait  :with_post do
    #   association :post
    # end
  end
end
