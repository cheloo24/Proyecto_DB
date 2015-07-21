class Foto < ActiveRecord::Base
  belongs_to :user
  has_many :calificacions, dependent: :destroy
  has_many :coments, dependent: :destroy
  has_attached_file :imagen, styles: {medium: "800x600"}
  validates_attachment_content_type :imagen, content_type: /image/
  before_create :set_comentarios, :set_time
  validates :imagen, presence: true
  validates :descripcion, presence: true

  scope :ultimos,->{order("fecha_foto DESC")}

  def self.search(search)
    if search
      self.where('n_comentarios LIKE ?', "%#{search}%")
    else
      self.all
    end
  end


  def agregar_puntuacion(increment)
    self.increment!(:puntuacion_total, increment)
  end


  def agregar_comentarios
    self.update(n_comentarios: self.n_comentarios + 1)
    
  end


  def borrar_comentarios
    self.update(n_comentarios: self.n_comentarios - 1)
    
  end


  private
  
  def set_comentarios
  	self.n_comentarios=0
  end

  def set_time
  	self.fecha_foto=DateTime.now
  	
  end


end
