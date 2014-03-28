class AddDateToStudent < ActiveRecord::Migration
  def change
    add_column :students, :attended_on, :date
  end
end
