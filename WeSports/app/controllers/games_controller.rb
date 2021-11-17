class GamesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @game = Game.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @player = Player.find(session[:user_id])
    if @player.nil?
      redirect_to '/login'
    end
    name = params[:name_search] || session[:name_search] || nil
    zip = params[:zip_search] || session[:zip_search] || nil
    @available = params[:only_available] || nil

    if params[:name_search] != session[:name_search] or params[:zip_search] != session[:zip_search] or params[:only_available] != session[:only_available]
      session[:name_search] = name
      session[:zip_search] = zip
      session[:only_available] = @available
      redirect_to :name_search => name, :zip_search => zip, :only_available => @available and return
    end

    if params[:only_available] == "1"
      if params[:name_search].blank? and params[:zip_search].blank?
        @games = Game.all().where("slots_to_be_filled != slots_taken")
      elsif !params[:name_search].blank? and params[:zip_search].blank?
        @sport = params[:name_search].downcase
        @games = Game.all.where("lower(sport_name) LIKE :name_search AND slots_to_be_filled != slots_taken", name_search: "%#{@sport}%")
      elsif params[:name_search].blank? and !params[:zip_search].blank?
        @zip = params[:zip_search].downcase
        @games = Game.all.where("zipcode LIKE :zip_search AND slots_to_be_filled != slots_taken", zip_search: "%#{@zip}%")
      else
        @sport = params[:name_search].downcase
        @zip = params[:zip_search].downcase
        @games = Game.all.where("lower(sport_name) LIKE :name_search AND zipcode LIKE :zip_search AND slots_to_be_filled != slots_taken", name_search: "%#{@sport}%", zip_search: "%#{@zip}%")
      end
    else
      if params[:name_search].blank? and params[:zip_search].blank?
        @games = Game.all()
      elsif !params[:name_search].blank? and params[:zip_search].blank?
        @sport = params[:name_search].downcase
        @games = Game.all.where("lower(sport_name) LIKE :name_search", name_search: "%#{@sport}%")
      elsif params[:name_search].blank? and !params[:zip_search].blank?
        @zip = params[:zip_search].downcase
        @games = Game.all.where("zipcode LIKE :zip_search", zip_search: "%#{@zip}%")
      else
        @sport = params[:name_search].downcase
        @zip = params[:zip_search].downcase
        @games = Game.all.where("lower(sport_name) LIKE :name_search AND zipcode LIKE :zip_search", name_search: "%#{@sport}%", zip_search: "%#{@zip}%")
      end
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    valid, notice = Game.add_game(game_params())
    flash[:notice] = notice
    if valid
      redirect_to games_path
    else
      redirect_to new_game_path
    end
  end

  def edit
    @game = Game.find params[:id]
  end

  def join
    @game = Game.find params[:id]
    @game.join_game()
    player_id = session[:user_id]
    valid, notice = PlayerGame.add_pair(params[:id], player_id)
    flash[:notice] = notice
    redirect_to game_path(@game)
  end

  def update
    @game = Game.find params[:id]
    valid, notice = @game.update_game(game_params())
    flash[:notice] = notice
    if valid
      redirect_to game_path(@game)
    else
      redirect_to edit_game_path(@game)
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:notice] = "Game '#{@game.sport_name}' deleted."
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:sport_name, :zipcode, :slots_to_be_filled, :slots_taken, :game_start_time, :game_end_time)
  end
end