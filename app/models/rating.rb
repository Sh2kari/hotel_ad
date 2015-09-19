class Rating < ActiveRecord::Base
  belongs_to :hotel
  belongs_to :user
  validates :user_id, uniqueness: { scope: :value,
                                    scope: :hotel_id }
end
