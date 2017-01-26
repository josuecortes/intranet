json.array!(@status_equipamentos) do |status_equipamento|
  json.extract! status_equipamento, :id, :status
  json.url status_equipamento_url(status_equipamento, format: :json)
end
