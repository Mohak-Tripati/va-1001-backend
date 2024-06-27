class CreateUserCompanyAddressMappings < ActiveRecord::Migration[7.1]
  def change
    create_table :user_company_address_mappings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
