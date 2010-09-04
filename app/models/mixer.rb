class Mixer < ActiveRecord::Base
  attr_accessible :name, :date, :location, :max_number, :description
end
