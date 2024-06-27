class CreateBusinessDays < ActiveRecord::Migration[7.1]
  def change
    create_table :business_days do |t|
      t.string :week_start
      t.string :business_days, array: true
      t.time :start_time
      t.time :end_time
      t.belongs_to :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
