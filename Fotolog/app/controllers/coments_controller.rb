class ComentsController < ApplicationController
  before_action :set_coment, only: [:update, :destroy]
  before_action :set_foto
  before_action :authenticate_user!, only: [:index]
  before_action :authenticate_admin!, only: [:index]

  # GET /coments
  # GET /coments.json

  # POST /coments
  # POST /coments.json
  def index
    @coments = Coment.where("foto_id = ?", params[:foto_id])
  end


  def create
    @coment = Coment.new(coment_params)
    @coment.foto = @foto


    respond_to do |format|
      if @coment.save
        format.html { redirect_to @coment.foto, notice: 'El comentario fue creado con exito.' }
        format.json { render :show, status: :created, location: @coment }
        @coment.foto.agregar_comentarios

      else
        format.html { render :new}
        format.json { render json: @coment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coments/1
  # PATCH/PUT /coments/1.json
  def update
    respond_to do |format|
      if @coment.update(coment_params)
        format.html { redirect_to @coment.foto, notice: 'El comentario fue editado con exito.' }
        format.json { render :show, status: :ok, location: @coment }
      else
        format.html { render :edit }
        format.json { render json: @coment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coments/1
  # DELETE /coments/1.json
  def destroy
    @coment.destroy
    respond_to do |format|
      format.html { redirect_to @foto, notice: 'El comentario fue eliminado con exito.' }
      @coment.foto.borrar_comentarios
      format.json { head :no_content }
    end
  end

  private
    def set_foto
      @foto = Foto.find(params[:foto_id])
      
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_coment
      @coment = Coment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coment_params
      params.require(:coment).permit(:foto_id, :user_id, :fecha_comentario, :texto_comentario, :anonimo)
    end
end
