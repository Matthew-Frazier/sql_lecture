class Api::LibrariesController < ApplicationController

  def index
    render json: Library.books_per_library
  end 
end
