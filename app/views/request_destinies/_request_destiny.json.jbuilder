json.extract! request_destiny, :id, :request_id, :destiny_id, :created_at, :updated_at
json.url request_destiny_url(request_destiny, format: :json)