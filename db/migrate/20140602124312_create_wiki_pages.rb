class CreateWikiPages < ActiveRecord::Migration
  def change
    create_table :wiki_pages do |t|
	  t.string :name, null: false, unique: true
      t.string :title, null: false
	  t.text :text
      t.timestamps
    end
	
	add_index :wiki_pages, :name, unique: true
	add_index :wiki_pages, :title, unique: true
  end
end
