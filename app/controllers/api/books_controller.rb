class Api::BooksController < ApplicationController
  def index
    render json: Book.top_genre
  end
end
