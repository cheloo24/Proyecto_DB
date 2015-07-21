class PerfilController < ApplicationController

  def show
  	
  	@users = User.find(params[:id])
  	if @users.is_admin?
		redirect_to root_url  	
	end

  end
end
