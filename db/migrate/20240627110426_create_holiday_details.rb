class CreateHolidayDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :holiday_details do |t|
      t.string :holiday_name
      t.date :holiday_date
      t.integer :year
      # t.belongs_to :company, null: false, foreign_key: true
      t.belongs_to :perspective, null: false, foreign_key: true

      t.timestamps
    end
  end
end
