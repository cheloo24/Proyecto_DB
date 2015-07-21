class CalificacionsController < ApplicationController
  before_action :set_calificacion, only: [:show, :edit, :update, :destroy]
  before_action :set_foto


  # GET /calificacions
  # GET /calificacions.json
  def index
    @calificacions = Calificacion.all
  end

  # GET /calificacions/new
  def new
    @calificacion = Calificacion.new
  end



  # POST /calificacions
  # POST /calificacions.json
  def create

    
      @calificacion = current_user.calificacions.new(calificacion_params)
      @calificacion.foto = @foto

      respond_to do |format|
        if @calificacion.save
          format.html { redirect_to @calificacion.foto , notice: 'Calificacion was successfully created.' }
          format.json { render :show, status: :created, location: @calificacion }
          @calificacion.foto.agregar_puntuacion(@calificacion.puntuacion)

        else
          format.html { render :new }
          format.json { render json: @calificacion.errors, status: :unprocessable_entity }
        end
      end
    
  end

  # DELETE /calificacions/1
  # DELETE /calificacions/1.json
  def destroy
    @calificacion.destroy
    respond_to do |format|
      format.html { redirect_to @foto, notice: 'Calificacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_foto
      @foto = Foto.find(params[:foto_id])      
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_calificacion
      @calificacion = Calificacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calificacion_params
      params.require(:calificacion).permit(:user_id, :foto_id, :puntuacion)
    end
end
