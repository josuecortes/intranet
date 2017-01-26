json.array!(@agendas) do |agenda|
  json.extract! agenda, :id, :tipo, :titulo, :informacoes, :data_hora, :publicado, :user_id
  json.url agenda_url(agenda, format: :json)
end
