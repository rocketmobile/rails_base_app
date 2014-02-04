# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name                  { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    email                 { Faker::Internet.email}
    password              'testing'
    password_confirmation 'testing'
  end
end
