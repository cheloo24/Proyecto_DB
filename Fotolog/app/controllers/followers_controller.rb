class FollowersController < ApplicationController
  before_action :set_follower, only: [:destroy]
  helper_method :sort_column, :sort_direction  


  # GET /followers
  # GET /followers.json
  def index
    @users = User.order("#{sort_column} #{sort_direction}") 

  end

  # GET /followers/1
  # GET /followers/1.json


  # POST /followers
  # POST /followers.json
  def create
    @follower = current_user.followers.build(:seguido_id => params[:seguido_id])

    respond_to do |format|
      if @follower.save
        format.html { redirect_to followers_url , notice: 'Estas siguiendo a este usuario.' }
        format.json { render :show, status: :created, location: @follower }
      else
        format.html { redirect_to followers_url, notice: 'Ya sigues a este usuario' }
        format.json { render json: @follower.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /followers/1
  # DELETE /followers/1.json
  def destroy
    @follower= current_user.followers.find(params[:id])
    @follower.destroy
    respond_to do |format|
      format.html { redirect_to followers_url, notice: 'Dejaste de seguir a este usuario.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follower
      @follower = Follower.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def follower_params
      params.require(:follower).permit(:user_id, :seguido_id)
    end
    def sort_column  
      Foto.column_names.include?(params[:sort]) ? params[:sort] : "email"    
    end  
      
    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"  
    end  
end
