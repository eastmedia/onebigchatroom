class AddDeletedByToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :deleted_by, :string
  end
end
