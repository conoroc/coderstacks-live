class Resource < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  scope :with_likes, order('likes_count DESC')


  has_many :likes
  belongs_to :user
  belongs_to :subcategory
  has_many :posts, dependent: :destroy

  #belongs_to :category, :through => :subcategory
  delegate :category, :to => :subcategory

  mount_uploader :image, ImageUploader

  def average_rating
    ratings.sum(:score) / ratings.size
  end


end
