require 'test_helper'

class FavorisControllerTest < ActionController::TestCase
  setup do
    @favori = favoris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favoris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favori" do
    assert_difference('Favori.count') do
      post :create, favori: { idUser: @favori.idUser, idWebCam: @favori.idWebCam, ordre: @favori.ordre, user_id: @favori.user_id, webcam_id: @favori.webcam_id }
    end

    assert_redirected_to favori_path(assigns(:favori))
  end

  test "should show favori" do
    get :show, id: @favori
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favori
    assert_response :success
  end

  test "should update favori" do
    patch :update, id: @favori, favori: { idUser: @favori.idUser, idWebCam: @favori.idWebCam, ordre: @favori.ordre, user_id: @favori.user_id, webcam_id: @favori.webcam_id }
    assert_redirected_to favori_path(assigns(:favori))
  end

  test "should destroy favori" do
    assert_difference('Favori.count', -1) do
      delete :destroy, id: @favori
    end

    assert_redirected_to favoris_path
  end
end
