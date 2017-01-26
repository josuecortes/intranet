json.array!(@equipamentos) do |equipamento|
  json.extract! equipamento, :id, :modelo, :configuracoes, :patrimonio
  json.url equipamento_url(equipamento, format: :json)
end
