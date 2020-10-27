FactoryBot.define do
  factory :friendship do
    user_id { 5 }
    friend_id { 6 }
    confirmed { false }
  end
end
