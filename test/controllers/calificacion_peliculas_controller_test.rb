require 'test_helper'

class CalificacionPeliculasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calificacion_pelicula = calificacion_peliculas(:one)
  end

  test "should get index" do
    get calificacion_peliculas_url
    assert_response :success
  end

  test "should get new" do
    get new_calificacion_pelicula_url
    assert_response :success
  end

  test "should create calificacion_pelicula" do
    assert_difference('CalificacionPelicula.count') do
      post calificacion_peliculas_url, params: { calificacion_pelicula: { id_calificacion_pelicula: @calificacion_pelicula.id_calificacion_pelicula, nombre_calificacion_pelicula: @calificacion_pelicula.nombre_calificacion_pelicula } }
    end

    assert_redirected_to calificacion_pelicula_url(CalificacionPelicula.last)
  end

  test "should show calificacion_pelicula" do
    get calificacion_pelicula_url(@calificacion_pelicula)
    assert_response :success
  end

  test "should get edit" do
    get edit_calificacion_pelicula_url(@calificacion_pelicula)
    assert_response :success
  end

  test "should update calificacion_pelicula" do
    patch calificacion_pelicula_url(@calificacion_pelicula), params: { calificacion_pelicula: { id_calificacion_pelicula: @calificacion_pelicula.id_calificacion_pelicula, nombre_calificacion_pelicula: @calificacion_pelicula.nombre_calificacion_pelicula } }
    assert_redirected_to calificacion_pelicula_url(@calificacion_pelicula)
  end

  test "should destroy calificacion_pelicula" do
    assert_difference('CalificacionPelicula.count', -1) do
      delete calificacion_pelicula_url(@calificacion_pelicula)
    end

    assert_redirected_to calificacion_peliculas_url
  end
end
