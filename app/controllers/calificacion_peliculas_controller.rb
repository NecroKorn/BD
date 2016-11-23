class CalificacionPeliculasController < ApplicationController
  before_action :set_calificacion_pelicula, only: [:show, :edit, :update, :destroy]

  # GET /calificacion_peliculas
  # GET /calificacion_peliculas.json
  def index
    @calificacion_peliculas = CalificacionPelicula.all
  end

  # GET /calificacion_peliculas/1
  # GET /calificacion_peliculas/1.json
  def show
  end

  # GET /calificacion_peliculas/new
  def new
    @calificacion_pelicula = CalificacionPelicula.new
  end

  # GET /calificacion_peliculas/1/edit
  def edit
  end

  # POST /calificacion_peliculas
  # POST /calificacion_peliculas.json
  def create
    @calificacion_pelicula = CalificacionPelicula.new(calificacion_pelicula_params)

    respond_to do |format|
      if @calificacion_pelicula.save
        format.html { redirect_to @calificacion_pelicula, notice: 'Calificacion pelicula was successfully created.' }
        format.json { render :show, status: :created, location: @calificacion_pelicula }
      else
        format.html { render :new }
        format.json { render json: @calificacion_pelicula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calificacion_peliculas/1
  # PATCH/PUT /calificacion_peliculas/1.json
  def update
    respond_to do |format|
      if @calificacion_pelicula.update(calificacion_pelicula_params)
        format.html { redirect_to @calificacion_pelicula, notice: 'Calificacion pelicula was successfully updated.' }
        format.json { render :show, status: :ok, location: @calificacion_pelicula }
      else
        format.html { render :edit }
        format.json { render json: @calificacion_pelicula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calificacion_peliculas/1
  # DELETE /calificacion_peliculas/1.json
  def destroy
    @calificacion_pelicula.destroy
    respond_to do |format|
      format.html { redirect_to calificacion_peliculas_url, notice: 'Calificacion pelicula was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calificacion_pelicula
      @calificacion_pelicula = CalificacionPelicula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calificacion_pelicula_params
      params.require(:calificacion_pelicula).permit(:id_calificacion_pelicula, :nombre_calificacion_pelicula)
    end
end
