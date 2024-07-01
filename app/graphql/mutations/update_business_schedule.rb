module Mutations
    class UpdateBusinessSchedule < Mutations::BaseMutation
        
        argument :id, ID, required: true
        argument :week_start, String, required: true
        argument :business_days, [String], required: true
        argument :start_time, String, required: true
        argument :end_time, String, required: true
        argument :perspective_id, ID, required: true
  
      field :business_schedule, Types::BusinessScheduleType, null: false
      field :errors, [String], null: false
  
      def resolve(args)
        business_schedule = BusinessSchedule.find_by(id: args[:id])
        return { business_schedule: nil, errors: ['BusinessScheduleType not found'] } if business_schedule.nil?
  
        perspective = Perspective.find_by(id: args[:perspective_id])
        return { business_schedule: nil, errors: ['Perspective not found'] } if perspective.nil?
  
        if business_schedule.update(args.except(:id, :perspective_id))
          { business_schedule: business_schedule, errors: [] }
        else
          { business_schedule: nil, errors: business_schedule.errors.full_messages }
        end
      end
    end
  end
  