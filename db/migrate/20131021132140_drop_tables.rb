class DropTables < ActiveRecord::Migration
  def up
    drop_table :rs_evaluations
    drop_table :rs_reputation_messages
    drop_table :rs_reputations
    drop_table :ratings
    drop_table :rates
    drop_table :rating_caches

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
