class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :major, :grad_year, :affiliation, :choice1, :choice2, :choice3, :choice4, :choice5
  
  
  # Other methods
  def full_name
    "#{first_name} #{last_name}"
  end
  
  # Lists
  SESSION_LIST = [ ["NSBE", 1], ["SHPE", 2] ]
  
  CHOICE1_LIST = [ ["Boeing", 1], ["Deloitte", 2], ["Exxon Mobil", 3], ["General Motors (GM)", 4], ["Intel", 5], ["Lockheed Martin", 6], ["Microsoft", 7], ["Proctor & Gamble (P&G)", 8], ["Qualcomm", 9], ["Schlumberger", 10] ]
  
  CHOICE2_LIST = [ ["Boeing", 1], ["Deloitte", 2], ["Exxon Mobil", 3], ["General Motors (GM)", 4], ["Intel", 5], ["Lockheed Martin", 6], ["Microsoft", 7], ["Proctor & Gamble (P&G)", 8], ["Qualcomm", 9], ["Schlumberger", 10] ]
  
  CHOICE3_LIST = [ ["Boeing", 1], ["Deloitte", 2], ["Exxon Mobil", 3], ["General Motors (GM)", 4], ["Intel", 5], ["Lockheed Martin", 6], ["Microsoft", 7], ["Proctor & Gamble (P&G)", 8], ["Qualcomm", 9], ["Schlumberger", 10] ]
  
  CHOICE4_LIST = [ ["Boeing", 1], ["Deloitte", 2], ["Exxon Mobil", 3], ["General Motors (GM)", 4], ["Intel", 5], ["Lockheed Martin", 6], ["Microsoft", 7], ["Proctor & Gamble (P&G)", 8], ["Qualcomm", 9], ["Schlumberger", 10] ]
  
  CHOICE5_LIST = [ ["Boeing", 1], ["Deloitte", 2], ["Exxon Mobil", 3], ["General Motors (GM)", 4], ["Intel", 5], ["Lockheed Martin", 6], ["Microsoft", 7], ["Proctor & Gamble (P&G)", 8], ["Qualcomm", 9], ["Schlumberger", 10] ]
  
MAJOR = [ ["Biological Science", 1], ["Business", 2], ["Chemical Engineering", 3], ["Chemistry", 4], ["CIT--Undeclared", 4], ["Civil Engineering", 5], ["Computer Science", 6], ["Electrical & Computer Engineering", 7], ["Information Systems Management", 8], ["Information Systems", 9], ["Material Science Engineering", 10], ["Mathematical Science", 11], ["Mechanical Engineering", 12], ["Physics", 13], ["Policy & Management", 14], ["Other", 15] ]  

  
  
  # Drop Down Menu alternate text methods
   def organization
     return "NSBE" if affliliation == 1
     "SHPE"
     end
   end
   
   def choice1
    return "Boeing" if choice1 == 1
    elsif
   end
  


