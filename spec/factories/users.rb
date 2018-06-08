FactoryBot.define do
    factory :user do |f|
        f.email "user@user.com"
        f.password "passpass"
        f.admin false
        f.encrypted_password "passpass"
        f.created_at DateTime.now
        f.updated_at DateTime.now
    end
    factory :admin, parent: :user do |f|
        f.email "admin@user.com"
        f.admin true
    end
end