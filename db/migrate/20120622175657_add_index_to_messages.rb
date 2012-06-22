class AddIndexToMessages < ActiveRecord::Migration
  def change
    add_index :messages, :handle
    add_index :messages, :deleted_by
  end
end
