json.array!(@murals) do |mural|
  json.extract! mural, :id, :texto, :user_id
  json.url mural_url(mural, format: :json)
end
