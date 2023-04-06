module Api
  class ComicsController < ApplicationController
    before_action :set_comic, only: %i[ show update destroy ]

    def index
      @comics = Comic.all.sorted_by_title

      render json: ComicsRepresentative.new(@comics).as_json
    end

    def show
      render json: @comic
    end

    def create
      @comic = Comic.new(comic_params)

      if @comic.save
        render json: @comic, status: :created, location: api_comic_url(@comic)
      else
        render json: @comic.errors, status: :unprocessable_entity
      end
    end

    def update
      if @comic.update(comic_params)
        render json: @comic
      else
        render json: @comic.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @comic.destroy
    end

    private

      def set_comic
        @comic = Comic.find(params[:id])
      end


      def comic_params
        params.require(:comic).permit(:title, :author, :synopsis)
      end
   end
end
