class CreateMixers < ActiveRecord::Migration
  def self.up
    create_table :mixers do |t|
      t.string :name
      t.datetime :date
      t.string :location
      t.integer :max_number
      t.text :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :mixers
  end
end
