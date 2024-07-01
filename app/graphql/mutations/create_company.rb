class Mutations::CreateCompany < Mutations::BaseMutation

        argument :company_name, String, required: true
        argument :industry_type, String, required: false
        argument :company_size, Integer, required: false
        argument :website_link, String, required: false
        argument :access_url, String, required: false
        argument :time_zone, GraphQL::Types::ISO8601DateTime, required: false
        argument :company_logo, String, required: false
        argument :custom_domain, String, required: false
        argument :fiscal_type, String, required: false
        argument :num_of_months, Integer, required: false
        argument :start_month, String, required: false
        argument :end_month, String, required: false
        argument :hierarchy_preference, String, required: false
        argument :reporting_manager, String, required: false
  
    field :company, Types::CompanyType, null: false
    field :errors, [String], null: false
  
    def resolve(args)
      company = Company.new(args)
      if company.save
        { company: company, errors: [] }
      else
        { company: nil, errors: company.errors.full_messages }
      end
    end
  end