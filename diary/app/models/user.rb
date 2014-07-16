require 'digest/sha1'
class User < ActiveRecord::Base

		
	validates_presence_of :password, :message => "password is not be blank"
	validates_presence_of :name, :message => "name is not be blank"


  attr_accessible :name, :password, :sex
	has_many :note

#	def self.hash(password)
#		Digest::SHA1.hexdigest(password)
#	end
end
