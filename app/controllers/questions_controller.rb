class QuestionsController < ApplicationController

	def index
	end

	def view
		@all_questions = Doubt.get_all_raised_doubts
	end

	def save_doubt
		title = validate_title
		description = validate_description
		validate_session
		unless is_error_already_raised?
			begin
				last_ques = Doubt.create_doubts({title:title, description:description, current_user: session[:current_user]})
				msg = I18n.t :doubt_insert
				prep_success_response([],msg)
				redirect_to "/questions/view"
			rescue Exception => e
				msg = I18n.t :doubt_insert_error
				prep_error_response(msg,e)
				redirect_to questions_path({title:title, description:description, error_message: msg})
			end
		end
	end

	def solve_doubt
		@unsolved_questions = Doubt.get_all_raised_doubts({answer_by:0})
	end

	def solve_specific_question
		@unsolved_question = Doubt.get_all_raised_doubts({answer_by:0, id:params[:id]}).try(:first)
	end

	def save_answers
		answer = params[:answer].gsub("  ", "") rescue nil
		doubt_data = Doubt.find_by_id(params[:post_id]) rescue nil
		if doubt_data.present? && answer.present?
			doubt_data.answer_by = session[:current_user]
			doubt_data.answer = answer
			doubt_data.save!
		end
		redirect_to questions_view_path
	end

	private

	#taking only 250 characters for title in doubts raised
	def validate_title
		return if is_error_already_raised?
		begin
			title = ""
			params[:title].gsub("  ", " ").split("").each do |k| 
				break if title.size >=250 
				title += k 
			end
			return title
		rescue Exception => e
			msg = I18n.t :invalid_title
			return prep_error_response(msg,e)
		end
	end

	#taking only relevant description
	def validate_description
		return if is_error_already_raised?
		begin
			return params[:description].gsub(" ", "")
		rescue Exception => e
			msg = I18n.t :invalid_description
			return prep_error_response(msg,e)
		end
	end

end
