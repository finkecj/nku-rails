class AddStudentToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :student, :string
  end
end
