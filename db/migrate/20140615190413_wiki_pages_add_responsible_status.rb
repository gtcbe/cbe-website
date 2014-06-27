class WikiPagesAddResponsibleStatus < ActiveRecord::Migration
  def change
	add_column :wiki_pages, :status, :int, default: 0
  end
end
