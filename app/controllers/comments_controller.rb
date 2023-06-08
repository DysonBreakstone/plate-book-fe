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

  def edit
  end

  def update
    if params[:intent] == "edit"
      BackendService.new.update_comment(edit_params)
    elsif params[:intent] == "delete"
      BackendService.new.update_comment(delete_params)
    else
      flash[:alert] = "Invalid action"
    end
    redirect_to user_path(params[:user])
  end

  private
    def edit_params
      {
        post_id: params[:post],
        user_id: params[:user],
        comment_id: params[:id],
        body: params[:body]
      }
    end
end