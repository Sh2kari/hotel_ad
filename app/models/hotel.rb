class Hotel < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image
  has_one :location
  has_many :comment

  accepts_nested_attributes_for :location
  validates :title, presence: true, length: { maximum: 50 }
  validates :room_description,      presence: true
  validates :price,                 presence: true
  validates :breakfast,             presence: true
end
