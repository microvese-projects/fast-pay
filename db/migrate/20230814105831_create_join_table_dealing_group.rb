class CreateJoinTableDealingGroup < ActiveRecord::Migration[7.0]
  def change
    create_join_table :dealings, :groups do |t|
      t.index [:dealing_id, :group_id]
      t.index [:group_id, :dealing_id]
    end
  end
end
