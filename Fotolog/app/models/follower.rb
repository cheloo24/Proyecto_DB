class Follower < ActiveRecord::Base
	belongs_to :user
	belongs_to :seguido, :class_name => "User"
	validates :user_id, uniqueness: { scope: :seguido_id}


	def son_amigos?(usuario_id,amigo_id)
    	if Follower.exist?(:user_id => "usuario_id", :seguido_id =>"amigo_id")
    		return true
    	else 
    		return false
    	end
  	end
end
