class Games::ConsolesController < ApplicationController
  before_action :set_games_console, only: [:show, :edit, :update, :destroy]

  # GET /games/consoles
  # GET /games/consoles.json
  def index
    @games_consoles = Games::Console.all
  end

  # GET /games/consoles/1
  # GET /games/consoles/1.json
  def show
  end

  # GET /games/consoles/new
  def new
    @games_console = Games::Console.new
  end

  # GET /games/consoles/1/edit
  def edit
  end

  # POST /games/consoles
  # POST /games/consoles.json
  def create
    @games_console = Games::Console.new(games_console_params)

    respond_to do |format|
      if @games_console.save
        format.html { redirect_to @games_console, notice: 'Console was successfully created.' }
        format.json { render :show, status: :created, location: @games_console }
      else
        format.html { render :new }
        format.json { render json: @games_console.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/consoles/1
  # PATCH/PUT /games/consoles/1.json
  def update
    respond_to do |format|
      if @games_console.update(games_console_params)
        format.html { redirect_to @games_console, notice: 'Console was successfully updated.' }
        format.json { render :show, status: :ok, location: @games_console }
      else
        format.html { render :edit }
        format.json { render json: @games_console.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/consoles/1
  # DELETE /games/consoles/1.json
  def destroy
    @games_console.destroy
    respond_to do |format|
      format.html { redirect_to games_consoles_url, notice: 'Console was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_games_console
      @games_console = Games::Console.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def games_console_params
      params.require(:games_console).permit(:name, :description, :console, :publisher, :url, :image, :min_players, :max_players, :image, :slug)
    end
end
