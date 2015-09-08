class CreateInserts < ActiveRecord::Migration
  def change
    create_table :inserts do |t|
      t.text :content
      t.references :draftee, index: true, foreign_key: true
      t.datetime :date, index: true
      t.string :type_of
      t.integer :content_id, :limit => 16

      t.timestamps null: false
    end
    add_index :inserts, [:draftee_id, :date]
  end
end
