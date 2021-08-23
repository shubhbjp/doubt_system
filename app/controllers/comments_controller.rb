class CommentsController < ApplicationController
	
	def index
	end

	def save_comment
		data={}
		validate_session
		data[:comment] = params[:comment]
		data[:post_id] = params[:post_id]
		data[:current_user] = session[:current_user]
		Comment.create_comments(data) if data[:comment].present?
		redirect_to questions_view_path
	end
end
