class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :country

      t.timestamps
    end
  end
end
