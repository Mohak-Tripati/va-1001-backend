class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :industry_type
      t.integer :company_size
      t.string :website_link
      t.string :access_url
      t.time :time_zone
      t.string :company_logo
      t.string :custom_domain
      t.string :fiscal_type
      t.integer :num_of_months
      t.string :start_month
      t.string :end_month
      t.string :hierarchy_preference
      t.string :reporting_manager

      t.timestamps
    end
  end
end
