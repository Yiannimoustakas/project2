class TestPairsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @test_pairs = TestPair.new
  end

  def create
    TestPair.create(test_pair_params)
    redirect_to test_pairs_path
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
  def challenge_params
    params.require(:test_pair).permit(:input, :output)
  end
end
