require 'faker'

FactoryGirl.define do
  factory :user do
    name 'xxxxxxx'
    email { Faker::Internet.email }
    password '11111111'
  end
end
