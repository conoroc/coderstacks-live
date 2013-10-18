class Category < ActiveRecord::Base




  has_many :subcategories
  has_many :resources, :through => :subcategories
end
