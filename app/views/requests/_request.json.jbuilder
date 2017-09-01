json.extract! request, :id, :tipo, :data_partida, :data_volta, :hora_partida, :hora_volta, :status, :user_id, :created_at, :updated_at
json.url request_url(request, format: :json)