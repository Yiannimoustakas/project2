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
    @test_pair = TestPair.find params[:id]
  end

  def update
    @test_pair = TestPair.find params[:id]
    @test_pair.save
    if @test_pair.update(test_pair_params)
      redirect_to( challenge_path( @test_pair.challenge_id ) )
    else
      flash[:errors] = @test_pair.errors.full_messages
      render :edit
    end
  end

  def destroy
    test_pair = TestPair.find params[:id]
    test_pair.destroy
    redirect_to challenge_path(test_pair.challenge_id)
  end

  private
  def test_pair_params
    params.require(:test_pair).permit(:input, :output, :test_pair_type, :challenge_id)
  end
end
