class GruposController < ApplicationController
  #load_and_authorize_resource
  before_action :set_grupo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /grupos
  # GET /grupos.json

  def index
    if current_user.rol == "administrador"
          @grupos = Grupo.all.order("profesor_id asc")
        elsif current_user.rol == "alumno"
          @grupos = Grupo.where(alumno_id: current_user.id).order("grupo asc")
        elsif current_user.rol == "profesor"
          @grupos = Grupo.where(profesor_id: current_user.id).order("grupo asc")
    end
  end
  # GET /grupos/1
  # GET /grupos/1.json
  def show
  end

  # GET /grupos/new
  def new
    @grupo = Grupo.new
  end

  # GET /grupos/1/edit
  def edit
  end

  # POST /grupos
  # POST /grupos.json
  def create
    @grupo = Grupo.new(grupo_params)

    respond_to do |format|
      if @grupo.save
        format.html { redirect_to @grupo, notice: 'El grupo ha sido creado.' }
        format.json { render :show, status: :created, location: @grupo }
      else
        format.html { render :new }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupos/1
  # PATCH/PUT /grupos/1.json
  def update
    respond_to do |format|
      if @grupo.update(grupo_params)
        format.html { redirect_to @grupo, notice: 'El grupo fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @grupo }
      else
        format.html { render :edit }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupos/1
  # DELETE /grupos/1.json
  def destroy
    @grupo.destroy
    respond_to do |format|
      format.html { redirect_to grupos_url, notice: 'El grupo ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo
      @grupo = Grupo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupo_params
      params.require(:grupo).permit(:alumno_id, :profesor_id, :asignatura_id, :calificacion, :grupo)
    end
   
end
