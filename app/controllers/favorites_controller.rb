class FavoritesController < ApplicationController

    before_action :require_signin
    before_action :set_movie

    def create
        @movie.favorites.create!(user: current_user)

        redirect_to @movie, notice: "Añadido a Favoritos!"
    end

    def destroy
        favorite = current_user.favorites.find(params[:id])
        favorite.destroy
      
        redirect_to movie , notice: "Eliminado de Favoritos!"
    end

    private

    def set_movie
        @movie = Movie.find_by!(slug: params[:id])
    end

end
