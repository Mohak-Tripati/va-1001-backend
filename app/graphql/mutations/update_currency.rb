module Mutations
    class UpdateCurrency < Mutations::BaseMutation
        
    argument :id, ID, required: true
    argument :home_currency, String, required: false
    argument :code_symbol, String, required: false
    argument :decimal_places, Integer, required: false
    argument :perspective_id, ID, required: false
  
      field :currency, Types::CurrencyType, null: true
      field :errors, [String], null: false
  
      def resolve(args)
        currency = Currency.find_by(id: args[:id])
        return { currency: nil, errors: ['Currency not found'] } if currency.nil?
  
        perspective = Perspective.find_by(id: args[:perspective_id])
        return { currency: nil, errors: ['Perspective not found'] } if perspective.nil?
  
        if currency.update(args.except(:id, :perspective_id))
          { currency: currency, errors: [] }
        else
          { currency: nil, errors: currency.errors.full_messages }
        end
      end
    end
  end
  