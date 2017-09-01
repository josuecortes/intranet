json.extract! request_passenger, :id, :request_id, :passenger_id, :created_at, :updated_at
json.url request_passenger_url(request_passenger, format: :json)