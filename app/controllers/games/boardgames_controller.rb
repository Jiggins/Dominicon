class Games::BoardgamesController < ApplicationController
  before_action :set_games_boardgame, only: [:show, :edit, :update, :destroy]

  # GET /games/boardgames
  # GET /games/boardgames.json
  def index
    @games_boardgames = Games::Boardgame.all
  end

  # GET /games/boardgames/1
  # GET /games/boardgames/1.json
  def show
  end

  # GET /games/boardgames/new
  def new
    @games_boardgame = Games::Boardgame.new
  end

  # GET /games/boardgames/1/edit
  def edit
  end

  # POST /games/boardgames
  # POST /games/boardgames.json
  def create
    @games_boardgame = Games::Boardgame.new(games_boardgame_params)

    respond_to do |format|
      if @games_boardgame.save
        format.html { redirect_to @games_boardgame, notice: 'Boardgame was successfully created.' }
        format.json { render :show, status: :created, location: @games_boardgame }
      else
        format.html { render :new }
        format.json { render json: @games_boardgame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/boardgames/1
  # PATCH/PUT /games/boardgames/1.json
  def update
    respond_to do |format|
      if @games_boardgame.update(games_boardgame_params)
        format.html { redirect_to @games_boardgame, notice: 'Boardgame was successfully updated.' }
        format.json { render :show, status: :ok, location: @games_boardgame }
      else
        format.html { render :edit }
        format.json { render json: @games_boardgame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/boardgames/1
  # DELETE /games/boardgames/1.json
  def destroy
    @games_boardgame.destroy
    respond_to do |format|
      format.html { redirect_to games_boardgames_url, notice: 'Boardgame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_games_boardgame
      @games_boardgame = Games::Boardgame.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def games_boardgame_params
      params.require(:games_boardgame).permit(:name, :description, :publisher, :url, :image, :min_players, :max_players, :slug)
    end
end
