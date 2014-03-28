class AttendancesController < ApplicationController
  
  def new 
    @attendance = Attendance.new
  end
  
  def create
    @attendance = Attendance.new
    @attendance.attended_on = Date.today
    @attendance.seat = params[:attendance][:seat]
    @attendance.student_id = current_student.id
    
    @attendance_exists = Attendance.where(attendances: {attended_on: Date.today, student_id: current_student.id})
    
    if(@attendance_exists.first == nil)
      @attendance.save
      redirect_to attendances_path, :notice => "You have successfully logged your attendance."
    else
      flash[:error] = "You have already created an attendance for today."
      render "new"
    end

  end
  
  def show
    @attendance = Attendance.find(params[:id])
  end
  
  def index
    @attendances = Attendance.all
  end
    
end
