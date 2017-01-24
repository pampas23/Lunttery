class Admin::AdminController< ApplicationController
	before_action :admin_only
	layout "admin"

	private
	def admin_only
		if current_user&&current_user.role =='admin'
		else
			redirect_to dinners_path
		end	
	end
end
