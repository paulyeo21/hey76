class CreateBings < ActiveRecord::Migration
  def change
    create_table :bings do |t|
      t.references :draftee, index: true, foreign_key: true
      t.datetime :date
      t.string :title, limit: 256
      t.string :description, limit: 512
      t.string :url, limit: 512
      t.string :thumbnail, limit: 512

      t.timestamps null: false
    end
  end
end
