class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :draftee, index: true, foreign_key: true
      t.datetime :date
      t.string :t_id

      t.timestamps null: false
    end
  end
end
