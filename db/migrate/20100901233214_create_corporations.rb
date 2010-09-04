class CreateCorporations < ActiveRecord::Migration
  def self.up
    create_table :corporations do |t|
      t.string :name
      t.text :description
      t.text :other_info
      t.timestamps
    end
  end
  
  def self.down
    drop_table :corporations
  end
end
