class SolutionsController < ApplicationController
  def new
    @solution = Solution.create
  end

  def create

  end

  def edit
    @solution = Solution.find(params[:id])
  end

  def update

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
end
