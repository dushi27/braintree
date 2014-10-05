json.array!(@individuals) do |individual|
  json.extract! individual, :id, :first_name, :last_name, :email, :phone, :date_of_birth, :ssn, :street_address, :city, :state, :zip
  json.url individual_url(individual, format: :json)
end
