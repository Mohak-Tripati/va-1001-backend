class Mutations::UpdateCompany < Mutations::BaseMutation

    argument :id, ID, required: true
        argument :company_name, String, required: false
        argument :industry_type, String, required: false
        argument :company_size, Integer, required: true
        argument :website_link, String, required: false
        argument :access_url, String, required: false
        argument :time_zone, GraphQL::Types::ISO8601DateTime, required: true
        argument :company_logo, String, required: false
        argument :custom_domain, String, required: false
        argument :fiscal_type, String, required: false
        argument :num_of_months, Integer, required: true
        argument :start_month, String, required: false
        argument :end_month, String, required: false
        argument :hierarchy_preference, String, required: false
        argument :reporting_manager, String, required: false

  
    field :company, Types::CompanyType, null: false
    field :errors, [String], null: false
  
    def resolve(args)
      company = Company.find_by(id: args[:id])
      return { company: nil, errors: ['Company not found'] } if company.nil?
  
      if company.update(args.except(:id))
        { company: company, errors: [] }
      else
        { company: nil, errors: company.errors.full_messages }
      end
    end
  end