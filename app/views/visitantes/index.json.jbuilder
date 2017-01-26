json.array!(@visitantes) do |visitante|
  json.extract! visitante, :id, :nome, :rg, :cpf
  json.url visitante_url(visitante, format: :json)
end
