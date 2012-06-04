require "digest"

class Adminuser < ActiveRecord::Base
	validates_presence_of :password
	validates_presence_of :username
	validates_presence_of :fullname
	validates :email, :presence => true, :email => true
	before_save :hash_password
	# Setup the salt value and hash the password before we save everything to the
  # database.
  def hash_password
       self.password = Digest::MD5.hexdigest(self.password)
  end
 
  
end
