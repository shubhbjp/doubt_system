class ApplicationController < ActionController::Base

	def initialize
		@error = false
		@response = {}
	end

	def is_error_already_raised?
		return @error
	end		

	def prep_error_response(shown_msg="", exception = {})
		@error=true
		Rails.logger.info "==== Exception | #{shown_msg} | #{request.url} | #{request.params} | #{exception.message} | #{exception.backtrace.first}" if exception.present?
		@response = {success:false, message: shown_msg}
	end

	def prep_success_response(data=[], msg="")
		@response = data.present? ? {success:true, data: data, message: msg} : {success:true, message: msg}
	end

	def validate_session
		return if session[:current_user].present?
		redirect_to "/"
	end
end
