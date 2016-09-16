FactoryGirl.define do
  factory :registration do
    password_digest Faker::Internet.password
    remember_digest Faker::Internet.password
    registrable { |x| x.association(:user) }
  end
end
