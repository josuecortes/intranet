json.array!(@detalhes_equipamentos) do |detalhes_equipamento|
  json.extract! detalhes_equipamento, :id, :modelo, :configuracao
  json.url detalhes_equipamento_url(detalhes_equipamento, format: :json)
end
