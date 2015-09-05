class CreateDraftees < ActiveRecord::Migration
  def change
    create_table :draftees do |t|
      t.string :name
      t.string :twitter
      t.string :instagram

      t.timestamps null: false
    end
    # add_column :draftees, :slug, :string, unique: true
  end
end
