json.array!(@tipo_equipamentos) do |tipo_equipamento|
  json.extract! tipo_equipamento, :id, :tipo
  json.url tipo_equipamento_url(tipo_equipamento, format: :json)
end
