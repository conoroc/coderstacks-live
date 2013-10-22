class AddMediumToResources < ActiveRecord::Migration
  def change
    add_column :resources, :medium, :integer
  end
end
