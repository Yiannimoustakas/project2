class TestPairsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @test_pair = TestPair.new
  end

  def create
    @test_pair = TestPair.new(test_pair_params)
    @test_pair.save
    redirect_to challenge_path(@test_pair.challenge_id), notice: 'Test Pair was successfully created'
  end

  def index
    @test_pairs = TestPair.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def test_pair_params
    params.require(:test_pair).permit(:input, :output, :challenge_id)
  end
end
