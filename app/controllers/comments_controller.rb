# frozen_string_literal: true

# controller for comments
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to article_path(params[:article_id]), notice: t(:comsuccreate)
    else
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:content).merge(article_id: params[:article_id])
  end
end
