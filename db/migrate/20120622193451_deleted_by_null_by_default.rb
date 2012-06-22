class DeletedByNullByDefault < ActiveRecord::Migration
  def up
    change_column :messages, :deleted_by, :string, :default => nil
  end

  def down
    change_column :messages, :deleted_by, :string, :default => nil
  end
end
