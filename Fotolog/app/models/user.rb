class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :fotos
  has_many :coments
  has_many :calificacions

  has_many :followers
  has_many :seguidos, :through => :followers
  has_many :inverse_followers, :class_name => "Follower", :foreign_key => "seguido_id"
  has_many :inverse_seguidos, :through => :inverse_followers, :source => :user
  before_create :fotos_diarias_usuario
  before_update :reset_contador_fotos

  def is_normal_user?
  	self.permission_level == 1
  end

  def is_admin?
  	self.permission_level == 2  	
  end


  def fotos_diarias_usuario
    self.update(fotos_diarias: self.fotos_diarias + 1)
  end

  def reset_contador_fotos
    if DateTime.current.at_beginning_of_day() == DateTime.current
      self.update_all(self.fotos_diarias = 0)
    end  
  end
end
