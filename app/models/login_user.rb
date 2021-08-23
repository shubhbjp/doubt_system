class LoginUser < ActiveRecord::Base
	has_many :doubt, :foreign_key => "raised_by"

	def initilize
		self.initilize
	end

	def self.create_unique_user(data)
		email = data[:email].present? ? data[:email].gsub(" ", "") : ""
		login_user = self.find_by_email(email) rescue nil
		return login_user.id if login_user.present?
		begin
			user_name = data[:name].present? ? data[:name].gsub("  ", " ") : ""
			login_user = self.create({name:user_name, email:email})
			return login_user.id
		rescue Exception => e
			return 0
		end
	end
end