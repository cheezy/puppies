class DropOrders < ActiveRecord::Migration
  def self.up
    drop_table :orders
  end

  def self.down
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :pay_type
      t.boolean :has_children
      t.boolean :has_other_pets
      t.string :other_pets_description

      t.timestamps
    end
  end
end
