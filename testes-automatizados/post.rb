require "httparty"
require "faker"
require "cpf_faker"
require "json"
require "uri"
require "net/http"


documento = Faker::CPF.numeric
email = Faker::Internet.email
senha = "Asdf1234//"
nome = "#{Faker::Name.name} teste"
fone = "+5534999999999"

Kernel.puts @documento 
Kernel.puts @email
Kernel.puts @senha
Kernel.puts @nome
Kernel.puts @fone


url = URI("https://dev.api.grupoqery.com.br/qery_authentication/create")
https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["content-type"] = "application/json"
request.body = "{
    \n\t\"document\": \"#{cpf}\",
    \n\t\"email\": \"#{email}\",
    \n\t\"password\": \"#{senha}\",
    \n\t\"name\": \"#{nome}\",
    \n\t\"phone\"\t: \"#{fone}\"\n
    }"

response = https.request(request)

Kernel.puts response.body
Kernel.puts response.header.inspect


# response = HTTP.post("", :body => {
# "document":"#{cpf}",
# "email":"#{email}",
# "password":"#{senha}",
# "name":"#{nome}",
# "phone":"#{fone}"
#})

Kernel.puts response
Kernel.puts "code: #{response.code}"
Kernel.puts "corpo: #{response.body}"
Kernel.puts "header: #{response.header.inspect}"
Kernel.puts "mensagem: #{response.message}"
Kernel.puts "status: #{response.status}"
