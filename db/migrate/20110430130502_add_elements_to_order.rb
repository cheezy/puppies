class AddElementsToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :has_children, :boolean
    add_column :orders, :has_other_pets, :boolean
    add_column :orders, :other_pets_description, :string
  end

  def self.down
    remove_column :orders, :has_children
    remove_column :orders, :has_other_pets
    remove_column :orders, :other_pets_description
  end
end
