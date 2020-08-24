Dado("o acesso da API") do
  $url = URI("https://dev.api.grupoqery.com.br/qery_authentication/create")
  $https = Net::HTTP.new($url.host, $url.port)
  $https.use_ssl = true
end

Quando("insiro dos dado necessarios e realizo a requisição") do
  @documento = Faker::CPF.numeric
  @email = Faker::Internet.email
  @senha = "Asdf1234//"
  @nome = "#{Faker::Name.name} teste"
  @fone = "+5534999999999"

  request = Net::HTTP::Post.new($url)
  request["content-type"] = "application/json"
  request.body = "{
        \n\t\"document\": \"#{@documento}\",
        \n\t\"email\": \"#{@email}\",
        \n\t\"password\": \"#{@senha}\",
        \n\t\"name\": \"#{@nome}\",
        \n\t\"phone\"\t: \"#{@fone}\"\n
        }"

  @response = $https.request(request)
end

Então("recebo o response code {string}") do |status|
  expect(@response.code).to eql status
end

Então("recebo description {string}") do |descrição|
  status = JSON.parse(@response.body)["status"]
  description = status["description"]
  expect(description).to eql descrição
end

Então("recebo o jwt token") do
  @result = JSON.parse(@response.body)["result"]
  jwt = @result["jwt"]
end

Então("recebo message {string} como resposta da requisição") do |mensagem|
  message = @result["message"]

  expect(message).to eql mensagem
end
