class Resource < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  scope :with_likes, order('likes_count DESC')


  has_many :likes
  belongs_to :user
  belongs_to :subcategory
  has_many :reviews, dependent: :destroy

  #belongs_to :category, :through => :subcategory
  delegate :category, :to => :subcategory

  mount_uploader :image, ImageUploader

  # def average_rating
  #   puts "SUM #{reviews.sum(:score)}"
  #   puts "SIZE #{reviews.size}"
  #   sum = reviews.sum(:score)
  #   reviews_count = reviews.size
  #
  #   sum/reviews_count
  #
  # end

  def average_rating
    reviews.average(:score).round(2, :up).to_f

  end


end
