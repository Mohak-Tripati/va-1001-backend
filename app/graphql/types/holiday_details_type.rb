module Types
    class HolidayDetailsType < Types::BaseObject
      
        field :id, ID, null: false
        field :year, Integer
        field :holiday_name, String
        field :holiday_date, GraphQL::Types::ISO8601Date
        
    end
  end