require "digest"

class Adminuser < ActiveRecord::Base
	has_many :user
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
  

  def password_matches?(password_to_match)
	
	#if !password_to_match.nil? 
		self.password == Digest::MD5.hexdigest(password_to_match)
	#else
		#puts 'hello'
	#end
	
  end
 
  
end
