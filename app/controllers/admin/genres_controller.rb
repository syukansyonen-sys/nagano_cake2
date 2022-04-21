class Admin::GenresController < ApplicationController
  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to #リダイレクト先は未設定
  end
  
  def index
    @genres = Genre.all
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to #リダイレクト先は未設定
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
