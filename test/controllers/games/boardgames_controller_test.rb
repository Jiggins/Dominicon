require 'test_helper'

class Games::BoardgamesControllerTest < ActionController::TestCase
  setup do
    @games_boardgame = games_boardgames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games_boardgames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create games_boardgame" do
    assert_difference('Games::Boardgame.count') do
      post :create, games_boardgame: { description: @games_boardgame.description, max_players: @games_boardgame.max_players, min_players: @games_boardgame.min_players, name: @games_boardgame.name, publisher: @games_boardgame.publisher, url: @games_boardgame.url }
    end

    assert_redirected_to games_boardgame_path(assigns(:games_boardgame))
  end

  test "should show games_boardgame" do
    get :show, id: @games_boardgame
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @games_boardgame
    assert_response :success
  end

  test "should update games_boardgame" do
    patch :update, id: @games_boardgame, games_boardgame: { description: @games_boardgame.description, max_players: @games_boardgame.max_players, min_players: @games_boardgame.min_players, name: @games_boardgame.name, publisher: @games_boardgame.publisher, url: @games_boardgame.url }
    assert_redirected_to games_boardgame_path(assigns(:games_boardgame))
  end

  test "should destroy games_boardgame" do
    assert_difference('Games::Boardgame.count', -1) do
      delete :destroy, id: @games_boardgame
    end

    assert_redirected_to games_boardgames_path
  end
end
