class CreateAdoptions < ActiveRecord::Migration
  def self.up
    create_table :adoptions do |t|
      t.integer :puppy_id
      t.integer :cart_id

      t.timestamps
    end
  end

  def self.down
    drop_table :adoptions
  end
end
