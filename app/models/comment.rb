class Comment < ActiveRecord::Base
	belongs_to :doubt, :class_name => 'Doubt', :foreign_key => "post_id"
	belongs_to :login_user, :class_name => 'LoginUser', :foreign_key => "comment_by"

	def initilize
		self.initilize
	end

	def self.create_comments(data)
		create_data = {}
		create_data[:comment] = data[:comment].present? ? data[:comment].gsub("  ", " ") : ""
		create_data[:post_id] = data[:post_id].present? ? data[:post_id].to_i : 0
		create_data[:comment_by] = data[:current_user]
		comment = self.create(create_data) rescue nil		
		return comment.id rescue 0
	end
end