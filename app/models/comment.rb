class Comment < ActiveRecord::Base
  validates :body, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :hotel_id, presence: true

  belongs_to :user
  belongs_to :hotel
end
