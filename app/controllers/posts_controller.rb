class PostsController < ApplicationController
  def new
  end

  def create
    PlatebookService.new.create_post(params)
  end
end