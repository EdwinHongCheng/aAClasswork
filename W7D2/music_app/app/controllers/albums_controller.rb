class AlbumsController < ApplicationController

    def new
        @album = Album.where(band_id: params[:band_id]).new

        render :new
    end

    def create
        @album = Album.new(album_params)

        if @album.save
            redirect_to album_url
        else

        end
    end


    private

    def album_params
        params.require(:album).permit(:title, :year, :band_id, :live?)
    end
end
