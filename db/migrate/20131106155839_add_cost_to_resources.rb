class AddCostToResources < ActiveRecord::Migration
  def change
    add_column :resources, :cost, :string
  end
end
