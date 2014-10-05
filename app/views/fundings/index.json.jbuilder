json.array!(@fundings) do |funding|
  json.extract! funding, :id, :email, :phone, :account_number, :routing_no, :agreed
  json.url funding_url(funding, format: :json)
end
