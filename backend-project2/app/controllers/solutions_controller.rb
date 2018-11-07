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
    solution.user_id = @current_user.id #should be 'current user'
    solution.save
    redirect_to controller: 'solutions', action: 'show', id: solution.id
  end

  def edit
    @solution = Solution.find(params[:id])
    @challenge = Challenge.find(@solution.challenge_id)
    @data = getData(@challenge).to_json.html_safe
  end

  def update
    solution = Solution.find(params[:id])
    solution.update(
      solution_params
    )
    redirect_to solution_path params[:id]
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
    params.require(:solution).permit(:code, :challenge_id)
  end

  def getData(challenge)
    data = challenge.test_pairs
    inputs = []
    outputs = []
    data.each{ |pair|
      if pair.integer_input_type? # if the input is meant to be a number, convert it to a float.
        input = pair.input.to_f;
      elsif pair.string_input_type? # if its meant to be a string, leave it as it is.
        input = pair.input;
      else                        # else it's meant to be an array, so split it on a pipe.
        input = pair.input.split('|');
      end
      inputs.push(input);

      if pair.output_integer? # if the input is meant to be a number, convert it to a float.
        output = pair.output.to_f;
      elsif pair.output_string? # if its meant to be a string, leave it as it is.
        output = pair.output;
      else                        # else it's meant to be an array, so split it on a pipe.
        output = pair.output.split('|');
      end
      outputs.push(output);
    };
    data = {inputs: inputs , outputs: outputs}
  end
end
