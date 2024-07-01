module Mutations
    class DeleteCurrency < Mutations::BaseMutation
      argument :id, ID, required: true
  
      field :currency, Types::CurrencyType, null: true
      field :errors, [String], null: true
  
      def resolve(id:)
        currency = Currency.find_by(id: id)
        return { currency: nil, errors: ['Currency not found'] } if currency.nil?
  
        if currency.destroy
          { currency: currency, errors: [] }
        else
          { currency: nil, errors: currency.errors.full_messages }
        end
      end
    end
  end
  