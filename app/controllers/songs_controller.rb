class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    @artists = Artist.all
  end 

  def create
    @song = Song.new(song_params)
    @song.save!
    redirect_to songs_path
  end

  def edit
    @song = Song.find_by(id: params[:id].to_i) 
    @artists = Artist.all
    
  end
  
  def update 
    @song = Song.find_by(id: params[:id].to_i) 
    @song.update(song_params)
    redirect_to songs_path
  end

  def show
    @song = Song.find_by(id: params[:id].to_i)
  end


  def destroy
    @song = Song.find_by(id: params[:id].to_i)
    @song.destroy
    redirect_to songs_path
  end 

  private
    def song_params
      params.require(:song).permit(:name, :artist_id)
    end 

end
