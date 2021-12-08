class CreateMiniposts < ActiveRecord::Migration[6.0]
  def change
    create_table :miniposts do |t|
      t.text :content
      t.datetime :datetime
      t.integer :user_id

      t.timestamps
    end
  end
end
