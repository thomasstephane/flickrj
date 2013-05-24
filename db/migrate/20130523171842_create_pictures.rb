class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :file, :name
      t.integer :user_id, :album_id

      t.timestamps
    end
  end
end
