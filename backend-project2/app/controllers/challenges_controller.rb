class ChallengesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = @current_user
    @challenge.save

    if @challenge.persisted?
        redirect_to challenge_path(@challenge.id)
    else
      flash[:errors] = @challenge.errors.full_messages
      render :new
    end
  end

  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find params[:id]

  end

  def edit
    @challenge = Challenge.find params[:id]
  end

  def update
    @challenge = Challenge.find params[:id]
    @challenge.save
    if @challenge.update(challenge_params)
      redirect_to( challenge_path( @challenge.id ) )
    else
      flash[:errors] = @challenge.errors.full_messages
      render :edit
    end
  end

  def destroy
    challenge = Challenge.find params[:id]
    challenge.destroy
    redirect_to challenges_path
  end

  private
  def challenge_params
    params.require(:challenge).permit(:name, :description, :user_id)
  end
end
