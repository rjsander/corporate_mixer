class Corporation < ActiveRecord::Base
  attr_accessible :name, :description, :other_info
end
