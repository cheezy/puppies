class AddQuantityToAdoption < ActiveRecord::Migration
  def self.up
    add_column :adoptions, :quantity, :integer, :default => 1
  end

  def self.down
    remove_column :adoptions, :quantity
  end
end
