FactoryBot.define do
    factory :discussion do |f|
        f.title "Discussion_title"
        f.body "Discussion_body"
    end
    factory :invalid_discussion, parent: :discussion do |f|
        f.title nil
    end
end