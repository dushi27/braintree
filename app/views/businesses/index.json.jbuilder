json.array!(@businesses) do |business|
  json.extract! business, :id, :leagal_name, :dba_name, :tax_id, :street_address, :city, :state, :zip
  json.url business_url(business, format: :json)
end
