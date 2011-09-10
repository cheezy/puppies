class AddDeliveredDateToAdoption < ActiveRecord::Migration
  def self.up
    add_column :adoptions, :delivered_on, :datetime
  end

  def self.down
    remove_column :adoptions, :delivered_on
  end
end
