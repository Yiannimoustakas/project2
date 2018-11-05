class CommentsController < ApplicationController
  def show
  end

  def index
  end

  def update
  end

  def edit
  end

  def new
  end

  def create
    @comment = Comment.create ({body:params[:body]})
    @comment.user_id = @current_user.id

    @comment.save

    if @comment.persisted?
    challenge = Challenge.find params[:idea_id].to_i
    challenge.comments << @comment
    challenge.save

    redirect_to challenges_path(challenge)

  end

  private
  def comment_params
    params.require(:comments).permit(:body)
  end
end
