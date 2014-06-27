class CommentsMakePolymorph < ActiveRecord::Migration
  def change
	rename_column :comments, :blogpost_id, :commentable_id
	add_column :comments, :commentable_type, :string
  end
end
