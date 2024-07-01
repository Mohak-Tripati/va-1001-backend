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
    # all data
    field :companies, [Types::CompanyType], null: false

    def companies
      Company.all 
    end

    # single data by id
    field :company, Types::CompanyType, null: false do
      argument :id, ID, required: true
    end 
    
    def company(id:)
      Company.find(id)
    end

    # holiday details 
    # all data
    field :holiday_details, [Types::HolidayDetailsType], null: false

    def holiday_details
      HolidayDetail.all
    end

    # single data by id
    field :holiday_detail, Types::HolidayDetailsType, null: false do
      argument :id, ID, required: true
    end 
    
    def holiday_detail(id:)
      HolidayDetail.find(id)
    end

    # business schedules
    # all data
    field :business_schedules, [Types::BusinessScheduleType], null: false

    def business_schedules
      BusinessSchedule.all
    end

    # single data by id
    field :business_schedule, Types::BusinessScheduleType, null: false do
      argument :id, ID, required: true
    end 
    
    def business_schedule(id:)
      BusinessSchedule.find(id)
    end

    # currency
    field :currencies, [Types::CurrencyType], null: false

    def currencies
      Currency.all
    end

    # single data by id
    field :currency, Types::CurrencyType, null: false do
      argument :id, ID, required: true
    end 
    
    def currency(id:)
      Currency.find(id)
    end

  end
end
