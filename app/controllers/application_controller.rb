class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  def current_student
    @current_student ||= Student.find_by(id: session[:student_id]) if session[:student_id].present?
  end
  helper_method :current_student
  private
  
 def require_login
   unless current_student
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_student_path
    end
  end
end
