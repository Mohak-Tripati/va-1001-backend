module Mutations
    class CreateBusinessSchedule < Mutations::BaseMutation
      argument :week_start, String, required: true
      argument :business_days, [String], required: true
      argument :start_time, String, required: true
      argument :end_time, String, required: true
      argument :perspective_id, ID, required: true
  
      field :business_schedule, Types::BusinessScheduleType, null: true
      field :errors, [String], null: true
  
      def resolve(week_start:, business_days:, start_time:, end_time:, perspective_id:)
        perspective = Perspective.find_by(id: perspective_id)
  
        if perspective.nil?
          return { business_schedule: nil, errors: ["Perspective not found."] }
        end
  
        business_schedule = BusinessSchedule.new(
          week_start: week_start,
          business_days: business_days,
          start_time: Time.parse(start_time),
          end_time: Time.parse(end_time),
          perspective_id: perspective_id
        )
  
        if business_schedule.save
          { business_schedule: business_schedule, errors: [] }
        else
          { business_schedule: nil, errors: business_schedule.errors.full_messages }
        end
      end
    end
  end
  