class Note < ActiveRecord::Base
	validates_presence_of :title, :message => "title can't be blank"
	validates_length_of :title, :maximum => 3

  attr_accessible :title
  attr_accessible :content
	belongs_to :user,{:foreign_key => "user_id"}	
	
end
