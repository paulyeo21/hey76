class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :draftee, index: true, foreign_key: true
      t.datetime :date, index: true
      t.string :type_of
      t.string :content_id
      t.string :url

      t.timestamps null: false
    end
  end
end
