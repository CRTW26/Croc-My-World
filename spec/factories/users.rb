require 'faker'

FactoryBot.define do
  factory :user do
    id { 5 }
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(max_length: 10) }
      trait :with_avatar do
        avatar { Rack::Test::UploadedFile.new('spec/assets/test-image.jpg', 'image/jpg') }
      end
      trait :friend do 
        id { 6 } 
      end 
  end
end
