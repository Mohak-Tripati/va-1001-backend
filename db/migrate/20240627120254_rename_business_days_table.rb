class RenameBusinessDaysTable < ActiveRecord::Migration[7.1]
  def change
    rename_table :business_days, :business_schedule
  end
end

