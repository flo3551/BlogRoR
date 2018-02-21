require 'test_helper'

class CommentairesControllerTest < ActionController::TestCase
  setup do
    @commentaire = commentaires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commentaires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commentaire" do
    assert_difference('Commentaire.count') do
      post :create, commentaire: { body: @commentaire.body, pseudo: @commentaire.pseudo }
    end

    assert_redirected_to commentaire_path(assigns(:commentaire))
  end

  test "should show commentaire" do
    get :show, id: @commentaire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commentaire
    assert_response :success
  end

  test "should update commentaire" do
    patch :update, id: @commentaire, commentaire: { body: @commentaire.body, pseudo: @commentaire.pseudo }
    assert_redirected_to commentaire_path(assigns(:commentaire))
  end

  test "should destroy commentaire" do
    assert_difference('Commentaire.count', -1) do
      delete :destroy, id: @commentaire
    end

    assert_redirected_to commentaires_path
  end
end
