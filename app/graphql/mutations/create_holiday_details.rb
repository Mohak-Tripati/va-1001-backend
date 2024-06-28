class Mutations::CreateHolidayDetails < Mutations::BaseMutation
    argument :year, Integer, required: true
    argument :holiday_name, String, required: true
    argument :holiday_date, GraphQL::Types::ISO8601Date, required: true
    argument :perspective_id, ID, required: true
  
    field :holiday_details, Types::HolidayDetailsType, null: true
    field :errors, [String], null: true
  
    def resolve(year:, holiday_name:, holiday_date:, perspective_id:)
      perspective = Perspective.find_by(id: perspective_id)
  
      if perspective.nil?
        return { holiday_details: nil, errors: ["Perspective not found."] }
      end
  
      holiday_detail = HolidayDetail.new(
        year: year,
        holiday_name: holiday_name,
        holiday_date: holiday_date,
        perspective_id: perspective_id
      )
  
      if holiday_detail.save
        { holiday_details: holiday_detail, errors: [] }
      else
        { holiday_details: nil, errors: holiday_detail.errors.full_messages }
      end
    end
  end
  