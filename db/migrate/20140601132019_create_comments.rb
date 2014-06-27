class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title, null: false
	  t.text :text, null: false
	  t.integer :user_id
	  t.integer :blogpost_id
      t.timestamps
    end
  end
end
