class Location < ActiveRecord::Base
	

	self.inheritance_column = nil
	has_many :notes, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}
	validates :address, presence: true, length: {minimum: 5}
	validates :type, presence: true, length: {minimum: 5}

	def self.search(query)
		where("title like ?", "%{query}%")
	end
end
