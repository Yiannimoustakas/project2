class SolutionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    # route to here from a challenge show page, so challenge id will be in params.
    @challenge_id = Challenge.first
    @solution = Solution.new
    @code_snippet = 'console.log(str)'
  end

  def create
    solution = Solution.new solution_params
    solution.user_id = User.first.id
    raise 'hell'
  end

  def edit
    @solution = Solution.first
  end

  def update
    solution = Solution.find(params[:id])
    solution.update(
      solution_params
    )
  end

  def index
    @solutions = Solution.all
  end

  def show
    @solution = Solution.find(params[:id])
  end

  def destroy
    solution = Solution.find(params[:id])
    solution.destroy()
  end

  private

  def solution_params
    params.permit(:code, :challenge_id)
  end
end
