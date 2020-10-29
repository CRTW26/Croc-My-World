FactoryBot.define do
  factory :friendship do
    user_id { 5 }
    friend_id { 6 }
    confirmed { false }
  end

  trait :confirm_request do 
    user_id { 6 }
    friend_id { 5 }
    confirmed { false }
  end 
end
