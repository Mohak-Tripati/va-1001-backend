class CreateCurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :currencies do |t|
      t.string :home_currency
      t.string :code_symbol
      t.integer :decimal_places
      t.belongs_to :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
