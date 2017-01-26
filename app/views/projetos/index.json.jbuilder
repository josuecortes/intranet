json.array!(@projetos) do |projeto|
  json.extract! projeto, :id, :nome, :resumo, :status, :publicado, :user_id
  json.url projeto_url(projeto, format: :json)
end
