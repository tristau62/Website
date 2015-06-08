class Location < ActiveRecord::Base
	self.inheritance_column = nil
	has_many :notes, dependent: :destroy
end
