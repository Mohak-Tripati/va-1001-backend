# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false 

    def users
      User.all # coming from models > User, these are active records of ruby on rails, coming from a gem, it replaces database queries like select * from user;
    end

    # graphql query
    field :user, [Types::UserType], null: false do
      argument :id, ID, required: true
    end 
    
    # ruby query
    def user(id:)
      User.find(id)
    end

    # company 
    field :company, [Types::CompanyType], null: false

    def company
      Company.all # coming from models > User, these are active records of ruby on rails, coming from a gem, it replaces database queries like select * from user;
    end

  end
end
