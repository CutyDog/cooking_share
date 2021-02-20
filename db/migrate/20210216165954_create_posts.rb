class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.integer :user_id
      t.text :text
      t.string :img

      t.timestamps
      
      t.index :title
    end
  end
end
