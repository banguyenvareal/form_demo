class ScheduleTestsController < ApplicationController
  def index
    @schedules = ScheduleTest.all
    render json: @schedules if request.xhr?

    # respond_to do |format|
    #   format.html
    #   format.json { render json: @schedules }
    # end
  end
end
