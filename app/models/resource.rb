class Resource < ActiveRecord::Base



  has_many :subcategories
  has_one :category, :through => :subcategories
end
