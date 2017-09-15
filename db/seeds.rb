
Role.find_or_create_by(:nome=>"PORTARIA")
Role.find_or_create_by(:nome=>"EDITOR")
Role.find_or_create_by(:nome=>"ESTATISTICAS")

Role.find_or_create_by(:nome=>"REQUISITANTE TRANSPORTE")
Role.find_or_create_by(:nome=>"USEGET TRANSPORTE")
Role.find_or_create_by(:nome=>"CAD TRANSPORTE")


r = Role.find_or_create_by(:nome=>"ADMINISTRADOR")
if r.save
	puts "Role ADMINISTRADOR criada"
else
	puts "Erro ao criar a role ADMINISTRADOR"
end

d = Departamento.find_or_create_by(:nome=>"NUCLEO DE INFORMATICA", :sigla=>"NUINFO")
if d.save
	puts "Departamento NUINFO criadO"
else
	puts "Erro ao criar departamento NUINFO"
end

u = User.new
u.name="ADMINISTRADOR DO SISTEMA"
u.email="administrador@helpdesk.com"
u.cpf="111.111.111-11"
u.password="12345678"
u.password_confirmation="12345678"
u.mudar_senha = false
u.ativo = true
u.departamento = d
u.roles << r

if u.save
	puts "Usuario Administrador Criado"
else
	puts "Erro ao Criar Usuario Administrador"
end

Role.find_or_create_by(:nome=>"TECNICO")
Role.find_or_create_by(:nome=>"REQUISITANTE")


Destiny.find_or_create_by(:nome=>"AMAPA", :municipio => "AMAPA", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"CALCOENE", :municipio => "CALCOENE", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"CUTIAS", :municipio => "CUTIAS", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"FERREIRA GOMES", :municipio => "FERREIRA GOMES", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"ITAUBAL", :municipio => "ITAUBAL", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"LARANJAL DO JARI", :municipio => "LARANJAL DO JARI", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"MACAPA", :municipio => "MACAPA", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"MAZAGAO", :municipio => "MAZAGAO", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"OIAPOQUE", :municipio => "OIAPOQUE", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"PEDRA BRANCA", :municipio => "PEDRA BRANCA", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"PORTO GRANDE", :municipio => "PORTO GRANDE", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"PRACUUBA", :municipio => "PRACUUBA", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"SANTANA", :municipio => "SANTANA", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"SERRA DO NAVIO", :municipio => "SERRA DO NAVIO", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"TARTARUGALZINHO", :municipio => "TARTARUGALZINHO", :tipo=>"VIAGEM")
Destiny.find_or_create_by(:nome=>"VITORIA DO JARI", :municipio => "VITORIA DO JARI", :tipo=>"VIAGEM")

Destiny.find_or_create_by(:nome=>"SEED", :municipio => "MACAPA", :tipo=>"ESPECIAL", :bairro=>"CENTRO", :logradouro=>"av fab", :numero=>"1537")
