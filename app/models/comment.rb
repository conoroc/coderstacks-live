class Comment < ActiveRecord::Base


  belongs_to :user

  belongs_to :post
  delegate :resource, :to => :post
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, length: { maximum: 25000 }
end
