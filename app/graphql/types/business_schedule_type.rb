# module Types
#     class BusinessScheduleType < Types::BaseObject
      
#         field :id, ID, null: false
#         field :week_start, String
#         field :business_days, [String]
#         field :start_time, GraphQL::Types::ISO8601DateTime, null: true
#         field :end_time, GraphQL::Types::ISO8601DateTime, null: true
        
#     end
#   end

# app/graphql/types/business_schedule_type.rb

module Types
    class BusinessScheduleType < Types::BaseObject
      field :id, ID, null: false
      field :week_start, String, null: true
      field :business_days, [String], null: true
      field :start_time, GraphQL::Types::ISO8601DateTime, null: true
      field :end_time, GraphQL::Types::ISO8601DateTime, null: true
      field :perspective_id, ID, null: false
    end
  end
  