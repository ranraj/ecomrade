json.extract! company, :id, :name, :description, :code, :logo, :created_at, :updated_at
json.url company_url(company, format: :json)
