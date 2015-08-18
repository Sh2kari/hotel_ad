class Location < ActiveRecord::Base
  belongs_to :hotels
  VALID_ADDRESS_REGEX = /\A[0-9a-zA-Z #,-]+\z/
  validates :country, allow_blank: true, format: { with: VALID_ADDRESS_REGEX }
  validates :city,    allow_blank: true, format: { with: VALID_ADDRESS_REGEX }
end
