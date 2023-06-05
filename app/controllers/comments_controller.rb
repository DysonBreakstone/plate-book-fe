class CommentsController < ApplicationController
  def create
    if PostsFacade.new.pass_muster?(params[:body])
      require 'pry'; binding.pry
    else
      flash[:alert] = "Your comment contains content that does not meet our community guidelines."
      redirect_to post_path(params[:id])
    end
  end
end