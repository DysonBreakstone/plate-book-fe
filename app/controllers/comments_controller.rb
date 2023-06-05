class CommentsController < ApplicationController
  def create
    # require 'pry'; binding.pry
    if PostsFacade.new.pass_muster?(params[:body])
      new_params = {
        user_id: params[:user_id].to_i,
        post_id: params[:post_id],
        body: params[:body]
      }
      response = PlatebookService.new.create_comment(new_params)
      redirect_to post_path(params[:post_id])
    else
      flash[:alert] = "Your comment contains content that does not meet our community guidelines."
      redirect_to post_path(params[:post_id])
    end
  end
end