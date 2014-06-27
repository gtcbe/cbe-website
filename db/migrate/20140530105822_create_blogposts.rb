class CreateBlogposts < ActiveRecord::Migration
  def change
    create_table :blogposts do |t|
	  t.string :name, null: false, unique: true
      t.string :title, null: false
	  t.text :text
	  t.boolean :published
	  t.integer :author_id
      t.timestamps
    end
	
	add_index :blogposts, :title, unique: true
  end
end
