json.extract! veiculo, :id, :tipo, :marca, :modelo, :ano, :cor, :placa, :combustivel, :validade_documento, :capacidade, :carga, :status, :posto_id, :motorista_id, :created_at, :updated_at
json.url veiculo_url(veiculo, format: :json)
