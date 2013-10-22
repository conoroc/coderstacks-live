class AddRatingToResources < ActiveRecord::Migration
  def change
    add_column :resources, :rating, :integer
  end
end
