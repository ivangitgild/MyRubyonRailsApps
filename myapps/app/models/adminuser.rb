require "digest"

class Adminuser < ActiveRecord::Base
	validates_presence_of :password
	# Setup the salt value and hash the password before we save everything to the
  # database.
  def before_save
    if (self.salt == nil)
      self.salt = random_numbers(5)
      self.password = Digest::MD5.hexdigest(self.salt + self.password)
    end
  end
 
  private
 
  # A sequence of random numbers with no skewing of range in any particular
  # direction and leading zeros preserved.
  def random_numbers(len)
    numbers = ("0".."9").to_a
    newrand = ""
    1.upto(len) { |i| newrand << numbers[rand(numbers.size - 1)] }
    return newrand
  end
end
