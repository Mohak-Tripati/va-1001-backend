class AddAddressLineToAddress < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :address_line, :string
  end
end
