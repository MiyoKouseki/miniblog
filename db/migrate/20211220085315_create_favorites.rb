class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :micropost_id
      t.integer :fan_id

      t.timestamps
    end
  end
end
