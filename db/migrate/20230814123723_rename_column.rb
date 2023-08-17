class RenameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :dealings, :user_id, :author_id
  end
end
