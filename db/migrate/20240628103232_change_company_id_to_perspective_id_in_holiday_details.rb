class ChangeCompanyIdToPerspectiveIdInHolidayDetails < ActiveRecord::Migration[7.1]
  def change
    # Remove the old foreign key and index
    remove_foreign_key :holiday_details, :companies
    remove_index :holiday_details, :company_id
    remove_column :holiday_details, :company_id

    # Add the new column with the foreign key and index
    add_column :holiday_details, :perspective_id, :bigint, null: false
    add_foreign_key :holiday_details, :perspectives, column: :perspective_id
    add_index :holiday_details, :perspective_id
  end
end
