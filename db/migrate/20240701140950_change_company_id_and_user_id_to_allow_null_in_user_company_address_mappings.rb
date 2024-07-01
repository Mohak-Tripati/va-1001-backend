class ChangeCompanyIdAndUserIdToAllowNullInUserCompanyAddressMappings < ActiveRecord::Migration[7.1]
  def change
    change_column_null :user_company_address_mappings, :company_id, true
    change_column_null :user_company_address_mappings, :user_id, true
  end
end
