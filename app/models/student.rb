class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :major, :grad_year, :affiliation, :choice_one, :choice_two, :choice_three, :choice_four, :choice_five
  
  # Arrays
  SESSION_LIST = [ ["NSBE", 1], ["SHPE", 2] ]

  CHOICES = [ ["Boeing", 1], ["Deloitte", 2], ["Exxon Mobil", 3], ["General Motors (GM)", 4], ["Intel", 5], ["Lockheed Martin", 6], ["Microsoft", 7], ["Proctor & Gamble (P&G)", 8], ["Qualcomm", 9], ["Schlumberger", 10] ]

  MAJOR = [ ["Biological Science", 1], ["Business", 2], ["Chemical Engineering", 3], ["Chemistry", 4], ["CIT--Undeclared", 4], ["Civil Engineering", 5], ["Computer Science", 6], ["Electrical & Computer Engineering", 7], ["Information Systems Management", 8], ["Information Systems", 9], ["Material Science Engineering", 10], ["Mathematical Science", 11], ["Mechanical Engineering", 12], ["Physics", 13], ["Policy & Management", 14], ["Other", 15] ]  
  
  #Named Scopes
  named_scope :get_affiliation, lambda { |aff| { :conditions => ['affiliation = ?', aff] } }
  named_scope :get_nsbe, :conditions => ['affiliation = ?', 1]
  named_scope :get_shpe, :conditions => ['affiliation = ?', 2]
  named_scope :get_email, lambda { |andrew_id| { :conditions => ['email = ?', andrew_id] } }
  

  #Validations
  validates_format_of :email, :with => /^\w+@+(andrew\.)?cmu.edu$/
  validates_presence_of :first_name, :last_name, :email, :major, :grad_year, :affiliation, :choice_one, :choice_two, :choice_three, :choice_four, :choice_five
  validates_uniqueness_of :email
  validate :check_choices


  # Other methods
  def full_name
    "#{first_name} #{last_name}"
  end


  # Drop Down Menu alternate text methods
  def get_organization
    return "NSBE" if affliliation == 1
    "SHPE"
  end
  
  def check_choices
    errors.add(:choice_one, "may not be selected more than once.") if choice_one == choice_two || choice_one == choice_three || choice_one == choice_four || choice_one == choice_five    
    errors.add(:choice_two, "may not be selected more than once.") if choice_two == choice_three || choice_two== choice_four || choice_two == choice_five
    errors.add(:choice_three, "may not be selected more than once.") if choice_three == choice_four || choice_three == choice_five  
    errors.add(:choice_four, "may not be selected more than once.") if choice_four == choice_five
  end
  


end




