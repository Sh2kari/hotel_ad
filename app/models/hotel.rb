class Hotel < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image
  has_one :location
  has_many :comment
  has_many :ratings
  has_many :raters, :through => :ratings, :source => :users

  accepts_nested_attributes_for :location
  validates :title, presence: true, length: { maximum: 50 }
  validates :room_description,      presence: true
  validates :price,                 presence: true
  validates :breakfast,             presence: true

  def average_rating
    @value = 0
    self.ratings.each do |rating|
      @value = @value + rating.value
    end
    @total = self.ratings.size
    @total == 0 ? 0 : (@value.to_f / @total.to_f).round(1)
  end
end
