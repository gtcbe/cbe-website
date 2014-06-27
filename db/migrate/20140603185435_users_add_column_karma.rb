class UsersAddColumnKarma < ActiveRecord::Migration
  def change
	add_column :users, :karma, :int, :default => 0
  end
end
