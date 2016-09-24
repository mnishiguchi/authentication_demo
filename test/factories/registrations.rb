FactoryGirl.define do
  factory :registration do
    email Faker::Internet.email
    password_digest Faker::Internet.password
    registrable { |x| x.association(:user) }
  end
end
