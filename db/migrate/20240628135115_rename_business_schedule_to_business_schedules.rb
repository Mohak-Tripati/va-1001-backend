class RenameBusinessScheduleToBusinessSchedules < ActiveRecord::Migration[7.1]
  def change
    rename_table :business_schedule, :business_schedules
  end
end
