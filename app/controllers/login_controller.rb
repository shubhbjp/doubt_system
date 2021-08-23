class LoginController < ApplicationController

	def index

	end

	def save_login
		session[:current_user] = []
		unless is_error_already_raised?
			begin
				lastId = LoginUser.create_unique_user({name: params[:name], email: params[:email]})
				session[:current_user] = lastId
				redirect_to questions_path
			rescue Exception => e
				msg = I18n.t :invalid_login
				redirect_to root_path
			end
		end
	end

end
