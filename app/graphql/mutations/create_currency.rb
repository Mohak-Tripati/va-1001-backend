class Mutations::CreateCurrency < Mutations::BaseMutation
    
    argument :home_currency, String, required: true
    argument :code_symbol, String, required: true
    argument :decimal_places, Integer, required: true
    argument :perspective_id, ID, required: true
  
    field :currency, Types::CurrencyType, null: true
    field :errors, [String], null: true
  
    def resolve(args)
      perspective = Perspective.find_by(id: args[:perspective_id])
  
      if perspective.nil?
        return { currency: nil, errors: ["Perspective not found."] }
      end
  
      currency = Currency.new(args)
  
      if currency.save
        { currency: currency, errors: [] }
      else
        { currency: nil, errors: currency.errors.full_messages }
      end
    end
  end