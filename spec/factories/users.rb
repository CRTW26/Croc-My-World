# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    id { 5 }
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(max_length: 10) }
    trait :with_avatar do
      # avatar { fixture_file_upload(Rails.root.join('spec', 'assets', 'test-image.jpg'), 'image/jpg') }
      avatar { Rack::Test::UploadedFile.new('spec/assets/test-image.jpg', 'image/jpg') }
    end
    trait :friend do
      id { 6 }
      # name { Faker::Name.name }
      # email { Faker::Internet.unique.email }
      # password { Faker::Internet.password(max_length: 10) }
    end
  end
end
