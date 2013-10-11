class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.string :type
      t.string :source
      t.string :level
      t.integer :year

      t.timestamps
    end
  end
end
