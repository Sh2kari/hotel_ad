class Hotel < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { maximum: 50 }
  validates :room_description,      presence: true
  validates :price,                 presence: true
  validates :breakfast,             presence: true
end
