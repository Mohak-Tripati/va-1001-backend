module Types
    class CurrencyType < Types::BaseObject
      
        field :id, ID, null: false
        field :home_currency, String
        field :code_symbol, String
        field :decimal_places, Integer
        
    end
  end