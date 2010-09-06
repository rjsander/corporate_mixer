class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :major, :grad_year, :affiliation, :choice_one, :choice_two, :choice_three, :choice_four, :choice_five
  
  # Arrays
  SESSION_LIST = [ ["NSBE", 1], ["SHPE", 2] ]

  CHOICES = [ ["Boeing", "Boeing"], ["Deloitte", "Deloitte"], ["Exxon Mobil", "Exxon Mobil"], ["General Motors (GM)", "General Motors (GM)"], ["Intel", "Intel"], ["Lockheed Martin", "Lockheed Martin"], ["Microsoft", "Microsoft"], ["Proctor & Gamble (P&G)", "Proctor & Gamble (P&G)"], ["Qualcomm", "Qualcomm"], ["Schlumberger", "Schlumberger"] ]

  MAJOR = [ ["Biological Science", 1], ["Business", 2], ["Chemical Engineering", 3], ["Chemistry", 4], ["CIT--Undeclared", 5], ["Civil Engineering", 6], ["Computer Science", 7], ["Electrical & Computer Engineering", 8], ["Information Systems Management", 9], ["Information Systems", 10], ["Material Science Engineering", 11], ["Mathematical Science", 12], ["Mechanical Engineering", 13], ["Physics", 14], ["Policy & Management", 15], ["Other", 16] ]  
  
  GRAD_YEAR = [ ["2011", 1], ["2012", 2], ["2013", 3], ["2014", 4] ,["2015", 5] ]
  
  
  #Named Scopes
  named_scope :get_affiliation, lambda { |aff| { :conditions => ['affiliation = ?', aff] } }
  named_scope :get_nsbe, :conditions => ['affiliation = ?', 1]
  named_scope :get_shpe, :conditions => ['affiliation = ?', 2]
  named_scope :by_registration_time, :order => "created_at"
  
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
    return "NSBE" if affiliation == 1
    "SHPE"
  end
  
  def check_choices
    errors.add(:choice_one, "may not be selected more than once.") if choice_one == choice_two || choice_one == choice_three || choice_one == choice_four || choice_one == choice_five    
    errors.add(:choice_two, "may not be selected more than once.") if choice_two == choice_three || choice_two== choice_four || choice_two == choice_five
    errors.add(:choice_three, "may not be selected more than once.") if choice_three == choice_four || choice_three == choice_five  
    errors.add(:choice_four, "may not be selected more than once.") if choice_four == choice_five
  end
  


end




