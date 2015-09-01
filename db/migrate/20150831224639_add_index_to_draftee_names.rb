class AddIndexToDrafteeNames < ActiveRecord::Migration
  def change
  	add_index :draftees, :name, unique: true
  end
end
