class CreateWikiHierarchies < ActiveRecord::Migration
  def change
    create_table :wiki_hierarchies do |t|
		t.integer :parent_id
		t.integer :child_id
		
		t.timestamps
    end
	add_index :wiki_hierarchies, :parent_id
	add_index :wiki_hierarchies, :child_id
	add_index :wiki_hierarchies, [:parent_id, :child_id], unique: true
  end
end
