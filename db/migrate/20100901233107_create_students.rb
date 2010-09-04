class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :major
      t.integer :grad_year
      t.string :affiliation
      t.string :choice1
      t.string :choice2
      t.string :choice3
      t.string :choice4
      t.string :choice5
      t.timestamps
    end
  end
  
  def self.down
    drop_table :students
  end
end
