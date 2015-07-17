class Circuit < ActiveRecord::Base
	#self.inheritance_column = nil
	has_attached_file :document
	has_many :documents, dependent: :destroy
end
