class CreatePuppies < ActiveRecord::Migration
  def self.up
    create_table :puppies do |t|
      t.string :name
      t.string :breed
      t.string :description
      t.string :gender
      t.string :image_url
      t.decimal :fees, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :puppies
  end
end
