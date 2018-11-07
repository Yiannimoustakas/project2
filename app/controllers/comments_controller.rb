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
    @comment = Comment.create({body:params[:body]})
    # @comment = Comment.new({body:params[:body]})
    @comment.user_id = @current_user.id
    @comment.save

    # raise 'hell'
    if @comment.persisted?
      solution = Solution.find params[:solution_id]
      solution.comments << @comment
      solution.save
      redirect_to solution_path(solution)
    end
  end

  private
  def comment_params
    params.require(:comments).permit(:body)
  end
end
