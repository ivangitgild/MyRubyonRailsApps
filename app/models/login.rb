class Login < ActiveRecord::Base

	def password_matches?(password_to_match)
		self.password == Digest::MD5.hexdigest(password_to_match)
  end
end