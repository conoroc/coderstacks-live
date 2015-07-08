class User < ActiveRecord::Base

  has_many :resources
  has_many :favorites
  has_many :favorite_resources, through: :favorites, source: :favorited, source_type: 'Resource'
  has_many :likes, :through => :resources
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
