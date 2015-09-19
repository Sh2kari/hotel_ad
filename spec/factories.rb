FactoryGirl.define do
  factory :user do
    email 'buba_sev4@example.com'
    password '12345678'
    password_confirmation '12345678'
  end

  factory :hotel do
    title 'title'
    price '666'
    room_description 'room'
    breakfast 'no'
  end

  factory :comment do
    body 'new_comment'
    hotel_id 'hotel.id'
    user_id 'user.id'
  end
end
