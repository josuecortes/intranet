json.extract! passenger, :id, :nome, :tipo, :matricula, :cpf, :respaldo, :created_at, :updated_at
json.url passenger_url(passenger, format: :json)