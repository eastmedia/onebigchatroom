# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120630020301) do

  create_table "heartbeats", :force => true do |t|
    t.string   "session_id"
    t.string   "room"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "heartbeats", ["session_id", "room"], :name => "index_heartbeats_on_session_id_and_room"

  create_table "messages", :force => true do |t|
    t.string   "handle"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "deleted_by"
  end

  add_index "messages", ["deleted_by"], :name => "index_messages_on_deleted_by"
  add_index "messages", ["handle"], :name => "index_messages_on_handle"

end
