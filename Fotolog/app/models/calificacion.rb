class Calificacion < ActiveRecord::Base
  belongs_to :user
  belongs_to :foto
  validates :user_id, uniqueness: { scope: :foto_id, message: "Ya calificaste esta foto"}
  validates_inclusion_of :puntuacion, :in => 1..10 , message: "La calificacion debe ir entre 1 a 10"
end
