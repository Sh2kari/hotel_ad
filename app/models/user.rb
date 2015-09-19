class User < ActiveRecord::Base
  has_many :hotels, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings
  has_many :rated_hotels, :through => :ratings, :source => :hotels
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
