class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :resource
  has_many :comments

  validates :user_id, presence: true

  validates :content, presence: true, length: { maximum: 25000 }
end
