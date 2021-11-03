class GamesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @game = Game.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    if params[:search].blank?
      @games = Game.all()
    else
      @sport = params[:search].downcase
      @games = Game.all.where("lower(sport_name) LIKE :search", search: "%#{@sport}%")
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @game = Game.create!(game_params)
    flash[:notice] = "#{@game.sport_name} was successfully created."
    redirect_to games_path
  end

  def edit
    @game = Game.find params[:id]
  end

  def update
    @game = Game.find params[:id]
    @game.update_attributes!(params[:game])
    flash[:notice] = "#{@game.sport_name} was successfully updated."
    redirect_to games_path(@game)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:notice] = "Game '#{@game.sport_name}' deleted."
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:sport_name, :zipcode, :slots_to_be_filled, :slots_taken, :game_start_time)
  end
end

