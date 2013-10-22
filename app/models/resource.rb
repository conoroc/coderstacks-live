class Resource < ActiveRecord::Base

  has_many :likes
  belongs_to :user
  belongs_to :subcategory
  #belongs_to :category, :through => :subcategory
  delegate :category, :to => :subcategory

  mount_uploader :image, ImageUploader

  def average_rating
    ratings.sum(:score) / ratings.size
  end
end
