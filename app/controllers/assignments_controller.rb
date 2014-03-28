class AssignmentsController < ApplicationController
  def index
    @assignment = Assignment.all
    if params[:student_id].present?
      @assignment=Student.find(params[:student_id]).assignments
    else
      nil
    end
  end
  def destroy
    @assignment=Assignment.find(params[:id])
    @assignment.destroy
    redirect_to assignments_path, notice: "Assignment deleted"
  end
  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to assignments_path, notice: "Assigment created"
    else
      render 'new'
    end
  end
  def new
      @assignment = Assignment.new
  end
  def import
    Assignment.import(params[:file])
    redirect_to assignments_path, notice: "Uploaded"
  end
 private
    def assignment_params
      params.require(:assignment).permit(:student, :name, :score, :total)
    end
end
