class ChangeFromDateToDateTime < ActiveRecord::Migration
  def change
    change_column :events, :start_date, :date_time
    change_column :events, :end_date, :date_time
  end
end
