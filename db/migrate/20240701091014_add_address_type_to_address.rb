class AddAddressTypeToAddress < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :address_type, :string
  end
end
