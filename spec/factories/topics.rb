include RandomData

FactoryGirl.define do
    factory :topic do
        # sequence(:name) { |n| "Topic Name #{n}" }
        name RandomData.random_name
        description RandomData.random_sentence
    end
end