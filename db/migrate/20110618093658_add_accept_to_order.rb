class AddAcceptToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :accept, :boolean
  end

  def self.down
    remove_column :orders, :accept
  end
end
