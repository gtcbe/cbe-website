class CommentsAddDefaultValueToTitle < ActiveRecord::Migration
  def change
	change_column :comments, :title, :string, :default => ""
  end
end
