class ChangeCompanyIdToPerspectiveIdInBusinessSchedule < ActiveRecord::Migration[7.1]
  def change
    # Remove the old foreign key and index
    remove_foreign_key :business_schedule, :companies
    remove_index :business_schedule, :company_id
    remove_column :business_schedule, :company_id

    # Add the new column with the foreign key and index
    add_column :business_schedule, :perspective_id, :bigint, null: false
    add_foreign_key :business_schedule, :perspectives, column: :perspective_id
    add_index :business_schedule, :perspective_id
  end
end
