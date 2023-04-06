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
      author = Author.create(author_params)
      @comic = Comic.new(comic_params.merge(author_id: author.id))

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
    def author_params
      params.require(:author).permit(:first_name, :last_name, :age)
    end
      def comic_params
        params.require(:comic).permit(:title, :synopsis)
      end
   end
end
