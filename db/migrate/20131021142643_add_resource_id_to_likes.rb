class AddResourceIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :resource_id, :integer
  end
end
