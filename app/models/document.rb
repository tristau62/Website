class Document < ActiveRecord::Base
	
	belongs_to :circuit
	has_attached_file :upload
end
