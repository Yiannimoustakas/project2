class CommentsController < ApplicationController
  def show
  end

  def index
  end

  def edit

      @comment = Comment.find params[:id]
      @solution = @comment.solution
      unless @comment.user == @current_user  #check if user id associated with comment, is the same as the currnet user
        flash[:error] = "You must be the owner of this comment to edit."
        redirect_to solution_path(solution)
      end
    end

    def update
      @comment = Comment.find params[:id]  #find comment
      @comment.update comment:params[:comment][:comment ]  #actual comment is a hash within a hash
      redirect_to solution_path(solution)
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
  
  def destroy
    @comment = Comment.find params[:id]
    unless @comment.user == @current_user
      flash[:error] = "You must be the owner of this comment to delete."
      redirect_to solution_path(@comment.solution_id)
      return
    end
    @comment.destroy
    redirect_to solution_path(@comment.solution_id)
  end

  private
  def comment_params
    params.require(:comments).permit(:body)
  end
  end
