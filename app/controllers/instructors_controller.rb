class InstructorsController < ApplicationController

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(params[:instructor])
    if @instructor.save
      redirect_to root_path
    else
      render  :new
    end

  end


end
