class AddLikesCountToResources < ActiveRecord::Migration
  def change
    add_column :resources, :likes_count, :integer
  end
end
