class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :profile
      t.text :blog_url

      t.timestamps
    end
  end
end
