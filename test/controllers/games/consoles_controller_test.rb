require 'test_helper'

class Games::ConsolesControllerTest < ActionController::TestCase
  setup do
    @games_console = games_consoles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games_consoles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create games_console" do
    assert_difference('Games::Console.count') do
      post :create, games_console: {
        console: @games_console.console,
        description: @games_console.description,
        max_players: @games_console.max_players,
        min_players: @games_console.min_players,
        name: @games_console.name,
        publisher: @games_console.publisher,
        slug: @games_console.slug,
        url: @games_console.url
      }
    end

    assert_redirected_to games_console_path(assigns(:games_console))
  end

  test "should show games_console" do
    get :show, id: @games_console
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @games_console
    assert_response :success
  end

  test "should update games_console" do
    patch :update, id: @games_console, games_console: {
      console: @games_console.console,
      description: @games_console.description,
      max_players: @games_console.max_players,
      min_players: @games_console.min_players,
      name: @games_console.name,
      publisher: @games_console.publisher,
      slug: @games_console.slug,
      url: @games_console.url
    }
    assert_redirected_to games_console_path(assigns(:games_console))
  end

  test "should destroy games_console" do
    assert_difference('Games::Console.count', -1) do
      delete :destroy, id: @games_console
    end

    assert_redirected_to games_consoles_path
  end
end
