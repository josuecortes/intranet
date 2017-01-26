json.array!(@informativos) do |informativo|
  json.extract! informativo, :id, :tipo, :titulo, :informacoes, :publicado, :user_id
  json.url informativo_url(informativo, format: :json)
end
