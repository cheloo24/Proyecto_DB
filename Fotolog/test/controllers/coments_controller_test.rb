require 'test_helper'

class ComentsControllerTest < ActionController::TestCase
  setup do
    @coment = coments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coment" do
    assert_difference('Coment.count') do
      post :create, coment: { anonimo: @coment.anonimo, fecha_comentario: @coment.fecha_comentario, foto_id: @coment.foto_id, texto_comentario: @coment.texto_comentario, user_id: @coment.user_id }
    end

    assert_redirected_to coment_path(assigns(:coment))
  end

  test "should show coment" do
    get :show, id: @coment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coment
    assert_response :success
  end

  test "should update coment" do
    patch :update, id: @coment, coment: { anonimo: @coment.anonimo, fecha_comentario: @coment.fecha_comentario, foto_id: @coment.foto_id, texto_comentario: @coment.texto_comentario, user_id: @coment.user_id }
    assert_redirected_to coment_path(assigns(:coment))
  end

  test "should destroy coment" do
    assert_difference('Coment.count', -1) do
      delete :destroy, id: @coment
    end

    assert_redirected_to coments_path
  end
end
