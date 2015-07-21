class FotosController < ApplicationController
  before_action :set_foto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:create, :show]
  before_action :just_user!, only: [:create, :new]
  before_action :validar_fotos_diarias! , only: [:create, :new]
  helper_method :sort_column, :sort_direction  
  # GET /fotos
  # GET /fotos.json
  def index
    if current_user.try(:is_admin?)
      @fotos = Foto.search(params[:search]).order("#{sort_column} #{sort_direction}") 
    else
      @fotos = current_user.fotos.ultimos
    end
  end

  # GET /fotos/1
  # GET /fotos/1.json
  def show
    @coment= Coment.new
    @calificacion = Calificacion.new
  end

  # GET /fotos/new
  def new
      @foto = Foto.new
   
  end

  # GET /fotos/1/edit
  def edit
  end

  # POST /fotos
  # POST /fotos.json
  def create

      @foto = current_user.fotos.new(foto_params)

      respond_to do |format|
        if @foto.save
          format.html { redirect_to @foto, notice: 'La foto fue creada con exito.' }
          format.json { render :show, status: :created, location: @foto }
          @foto.user.fotos_diarias_usuario

        else
          format.html { render :new }
          format.json { render json: @foto.errors, status: :unprocessable_entity }
        end
      end

  end

  # PATCH/PUT /fotos/1
  # PATCH/PUT /fotos/1.json
  def update
    respond_to do |format|
      if @foto.update(foto_params)
        format.html { redirect_to @foto, notice: 'La foto fue editada con exito.' }
        format.json { render :show, status: :ok, location: @foto }
      else
        format.html { render :edit }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fotos/1
  # DELETE /fotos/1.json
  def destroy
    @foto.destroy
    respond_to do |format|
      format.html { redirect_to fotos_url, notice: 'La foto fue eliminada con exito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foto
      @foto = Foto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foto_params
      params.require(:foto).permit(:user_id, :fecha_foto, :descripcion, :n_comentarios, :imagen)
    end

    def validate_user
      redirect_to new_user_session_path, notice:"Necesitas iniciar sesion"      
    end

    def sort_column  
      Foto.column_names.include?(params[:sort]) ? params[:sort] : "id"    
    end  
      
    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"  
    end  
end
