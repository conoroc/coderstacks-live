class Like < ActiveRecord::Base

  belongs_to :resource, :counter_cache => true
  belongs_to :user
end
