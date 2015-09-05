class CreateInserts < ActiveRecord::Migration
  def change
    create_table :inserts do |t|
      t.text :content
      t.references :draftee, index: true, foreign_key: true
      t.datetime :date, index: true
      t.string :type

      t.timestamps null: false
    end
    add_index :inserts, [:draftee_id, :date]
  end
end
