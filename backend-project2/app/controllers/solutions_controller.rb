class SolutionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    # route to here from a challenge show page, so challenge id will be in params.
    # @challenge = Challenge.first Hard Code.
    # This is the params passed form the link_to on challenge show page
    @challenge = Challenge.find params[:id]
    @data = getData(@challenge).to_json.html_safe
    @solution = Solution.new
    @solution.challenge_id = @challenge.id
  end

  def create
    solution = Solution.new solution_params
    # @challenge = Challenge.find params[:id]
    solution.user_id = User.first.id #should be 'current user'
    solution.challenge_id = params[:challenge_id]
    solution.save
    redirect_to controller: 'solutions', action: 'show', id: solution.id
  end

  def edit
    @solution = Solution.find(params[:id])
    @challenge = Challenge.find(@solution.challenge_id)
    @data = getData(@challenge).to_json.html_safe
  end

  def update
    raise 'hell'
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
    @challenge = Challenge.find(@solution.challenge_id)
    @data = getData(@challenge).to_json.html_safe
  end

  def destroy
    solution = Solution.find(params[:id])
    solution.destroy()
    redirect_to controller: 'users', action: 'show', id: @current_user.id
  end

  private

  def solution_params
    params.permit(:code, :challenge_id)
  end

  def getData(challenge)
    inputs = challenge.test_pairs.pluck(:input)
    outputs = challenge.test_pairs.pluck(:output)
    data = {inputs: inputs,outputs: outputs}
  end
end
