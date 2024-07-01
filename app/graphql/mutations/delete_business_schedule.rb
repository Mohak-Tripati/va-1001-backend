module Mutations
    class DeleteBusinessSchedule < Mutations::BaseMutation
      argument :id, ID, required: true
  
      field :business_schedule, Types::BusinessScheduleType, null: true
      field :errors, [String], null: true
  
      def resolve(id:)
        business_schedule = BusinessSchedule.find_by(id: id)
        return { business_schedule: nil, errors: ['BusinessSchedules not found'] } if business_schedule.nil?
  
        if business_schedule.destroy
          { business_schedule: business_schedule, errors: [] }
        else
          { business_schedule: nil, errors: business_schedule.errors.full_messages }
        end
      end
    end
  end
  