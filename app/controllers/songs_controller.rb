class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params(:artist_name, :genre, :title, :released, :release_year))

    redirect_to song_path(@song)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to songs_path 
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
