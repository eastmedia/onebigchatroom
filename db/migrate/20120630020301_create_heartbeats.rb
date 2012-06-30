class CreateHeartbeats < ActiveRecord::Migration
  def change

    create_table :heartbeats do |t|
      t.string :session_id
      t.string :room
      t.timestamps
    end

    add_index :heartbeats, [:session_id, :room]

  end
end
