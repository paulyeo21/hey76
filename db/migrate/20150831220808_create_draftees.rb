class CreateDraftees < ActiveRecord::Migration
  def change
    create_table :draftees do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
