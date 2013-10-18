class AddSubcategoryIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :subcategory_id, :integer
  end
end
