class Coment < ActiveRecord::Base
  belongs_to :foto
  belongs_to :user
  before_create :set_time
  validates :texto_comentario, presence: true, length: {maximum: 200}
  validates :anonimo, presence: true

    def set_time
  		self.fecha_comentario=DateTime.now
  	end


end
