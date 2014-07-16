require 'digest/sha1'
class User < ActiveRecord::Base

	validates_presence_of :name, :message => "name is not be blank"
	validates_length_of :name, :in => 4..10
	validates_uniqueness_of :name, :message => 'name is aready exists'
	validates_presence_of :password, :message => "password is not be blank"

  attr_accessible :name, :password, :sex
	has_many :note

#	def self.hash(password)
#		Digest::SHA1.hexdigest(password)
#	end
end
