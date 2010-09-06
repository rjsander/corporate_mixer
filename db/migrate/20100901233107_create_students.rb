class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :major
      t.integer :grad_year
      t.integer :affiliation
      t.boolean :active
      t.text :comments
      t.string :choice_one
      t.string :choice_two
      t.string :choice_three
      t.string :choice_four
      t.string :choice_five
      t.timestamps
    end
  end
  
  def self.down
    drop_table :students
  end
end
