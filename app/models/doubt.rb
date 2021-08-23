class Doubt < ActiveRecord::Base
	belongs_to :login_user, :class_name => 'LoginUser', :foreign_key => "raised_by"
	has_many :comment, :foreign_key => "post_id"
	def initilize
		self.initilize
	end

	def self.create_doubts(data)
		create_data = {}
		create_data[:title] = data[:title].present? ? data[:title].gsub("  ", " ") : ""
		doubt = self.find_by_title(create_data[:title]) rescue nil
		return doubt.id if doubt.present?
		create_data[:description] = data[:description].present? ? data[:description].gsub("  ", " ") : ""
		create_data[:raised_by] = data[:current_user]
		doubt = self.create(create_data) rescue nil
		return doubt.id rescue 0
	end

	def self.get_all_raised_doubts(where_cond={})
		where_cond.present? ? self.includes(:login_user, :comment).where(where_cond).order("doubts.created_at desc") : self.includes(:login_user, :comment).order("doubts.created_at desc")
	end
end