class Rating < ActiveRecord::Base
  belongs_to :hotel
  belongs_to :user
end
