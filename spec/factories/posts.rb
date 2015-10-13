include RandomData

FactoryGirl.define do
    factory :post do
        sequence(:title) { |n| "Post Title #{n}" }
        body RandomData.random_paragraph
        topic
        user
        rank 0.0
    end
end