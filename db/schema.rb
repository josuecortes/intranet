# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170525125639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendas", force: :cascade do |t|
    t.string   "tipo"
    t.string   "titulo"
    t.text     "informacoes"
    t.datetime "data_hora"
    t.boolean  "publicado",   default: false
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "arquivos", force: :cascade do |t|
    t.string   "nome"
    t.integer  "informativo_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "avatar"
  end

  create_table "chamados", force: :cascade do |t|
    t.integer  "problema_id"
    t.text     "observacoes_usuario"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "data_status_aberto"
    t.datetime "data_status_fechado"
    t.datetime "data_status_em_atendimento"
    t.datetime "data_status_concluido"
    t.text     "parecer_preliminar_tecnico"
    t.text     "parecer_final_tecnico"
    t.text     "motivo_cancelamento"
    t.text     "avaliacao_usuario"
    t.integer  "nivel_satisfacao_usuario"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "data_status_cancelado"
    t.integer  "tecnico_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "departamentos", force: :cascade do |t|
    t.string   "nome"
    t.string   "sigla"
    t.string   "email"
    t.string   "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departamentos_projetos", id: false, force: :cascade do |t|
    t.integer "projeto_id",      null: false
    t.integer "departamento_id", null: false
  end

  add_index "departamentos_projetos", ["departamento_id", "projeto_id"], name: "index_departamentos_projetos_on_departamento_id_and_projeto_id", using: :btree
  add_index "departamentos_projetos", ["projeto_id", "departamento_id"], name: "index_departamentos_projetos_on_projeto_id_and_departamento_id", using: :btree

  create_table "detalhes_equipamentos", force: :cascade do |t|
    t.string   "modelo"
    t.string   "configuracao"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "tipo_equipamento_id"
  end

  create_table "equipamentos", force: :cascade do |t|
    t.string   "patrimonio"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "status_equipamento_id"
    t.integer  "departamento_id"
    t.string   "situacao"
    t.integer  "detalhes_equipamento_id"
    t.integer  "departamento_emprestimo_id"
    t.string   "responsavel"
    t.string   "data_patrimonio"
    t.integer  "quantidade"
    t.string   "nome"
  end

  create_table "etapas", force: :cascade do |t|
    t.string   "nome"
    t.string   "data_inicio"
    t.string   "data_final"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "projeto_id"
  end

  create_table "etapas_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "etapa_id", null: false
  end

  add_index "etapas_users", ["etapa_id", "user_id"], name: "index_etapas_users_on_etapa_id_and_user_id", using: :btree
  add_index "etapas_users", ["user_id", "etapa_id"], name: "index_etapas_users_on_user_id_and_etapa_id", using: :btree

  create_table "incidentes", force: :cascade do |t|
    t.text     "descricao"
    t.text     "status"
    t.text     "observacoes"
    t.integer  "tipo_incidente_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "data_inicio"
    t.string   "previsao_fim"
    t.string   "data_fim"
  end

  create_table "informativos", force: :cascade do |t|
    t.string   "tipo"
    t.string   "titulo"
    t.text     "informacoes"
    t.boolean  "publicado",   default: false
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "avatar"
  end

  create_table "inventarios", force: :cascade do |t|
    t.integer  "departamento_id"
    t.integer  "quantidade"
    t.string   "estado"
    t.text     "observacoes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itens", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "murals", force: :cascade do |t|
    t.text     "texto"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordems", force: :cascade do |t|
    t.string   "status"
    t.datetime "data_status_aberto"
    t.datetime "data_status_em_atendimento"
    t.datetime "data_status_concluido"
    t.datetime "data_status_aguardando"
    t.datetime "data_status_fechado"
    t.integer  "user_id"
    t.integer  "cliente_id"
    t.integer  "departamento_id"
    t.string   "tipo_equipamento"
    t.text     "especificacoes"
    t.text     "condicoes"
    t.text     "problema"
    t.text     "acoes"
    t.text     "conversa"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "chamado_id"
    t.text     "historico"
    t.string   "cabecalho"
  end

  create_table "problemas", force: :cascade do |t|
    t.text     "descricao"
    t.text     "solucao"
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projetos", force: :cascade do |t|
    t.string   "nome"
    t.text     "resumo"
    t.string   "status"
    t.boolean  "publicado",       default: false
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "objetivo"
    t.date     "data_inicial"
    t.date     "data_final"
    t.integer  "departamento_id"
    t.string   "local"
    t.string   "metodo"
    t.string   "custo"
  end

  create_table "projetos_users", id: false, force: :cascade do |t|
    t.integer "projeto_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "projetos_users", ["projeto_id", "user_id"], name: "index_projetos_users_on_projeto_id_and_user_id", using: :btree
  add_index "projetos_users", ["user_id", "projeto_id"], name: "index_projetos_users_on_user_id_and_projeto_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  add_index "roles_users", ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", using: :btree
  add_index "roles_users", ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id", using: :btree

  create_table "status_equipamentos", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_equipamentos", force: :cascade do |t|
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_incidentes", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.boolean  "ativo",                  default: true
    t.boolean  "mudar_senha",            default: true
    t.integer  "departamento_id"
    t.string   "cpf"
    t.date     "nascimento"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visita", force: :cascade do |t|
    t.integer  "visitante_id"
    t.integer  "departamento_id"
    t.text     "observacoes"
    t.datetime "entrada"
    t.datetime "saida"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "status"
  end

  create_table "visitantes", force: :cascade do |t|
    t.string   "nome"
    t.string   "rg"
    t.string   "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
