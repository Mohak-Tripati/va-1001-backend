class ChangeCompanyIdToPerspectiveIdInCurrencies < ActiveRecord::Migration[7.1]
  def change
    # Remove the old foreign key and index
    remove_foreign_key :currencies, :companies
    remove_index :currencies, :company_id
    remove_column :currencies, :company_id

    # Add the new column with the foreign key and index
    add_column :currencies, :perspective_id, :bigint, null: false
    add_foreign_key :currencies, :perspectives, column: :perspective_id
    add_index :currencies, :perspective_id
  end
end
