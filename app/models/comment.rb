class Comment < ActiveRecord::Base


  belongs_to :user

  belongs_to :review
  delegate :resource, :to => :review
  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :content, presence: true, length: { maximum: 25000 }
end
