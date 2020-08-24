#language: pt

Funcionalidade: Cadastro e login 
    sendo usuario desejo criar uma conta Qery via API
    Para acessar o login
    @temp 
    Cenario: Criação de conta 
        Dado o acesso da API
        Quando insiro dos dado necessarios e realizo a requisição
        Então recebo o response code "200"
        E recebo description "SUCCESS" 
        E recebo o jwt token
        E recebo message "Cadastrado" como resposta da requisição

    Cenario: Aceita termos de uso
        Dado que recebido o "jwt" pelo cadartro
        Quando efetua a requisição para aceitar os termos de uso 
        Então recebo o "status code" "200"
        E recebo "description" "SUCCESS"
        E recebo "message" "Salvo" como resposta da requisição

    Cenario: Fazer login com sucesso 
        Dado que a conta ja esteja criada
        Quando insiro os dados para login e realizo a requisição
        Então recebo o "status code" "200" 
        E recebo "description" "SUCCESS" 
        E recebo o "jwt" token
        E recebo "email_valid" "true" como resposta da requisição


    Cenario: Esqueceu a senha 
        Dado que a conta ja esteja criada
        Mas a senha tenha sido esquecida
        Quando insiro a senha de requisição e realizo a requisição 
        Então recebo o "status code" "200"
        E recebo "description" "SUCCESS" 
        E recebo "message" "E-mail enviado" como resposta da requisição

   
    Cenario: pagar a mensalidade
        Dado que meu banco ja esteja cadastrado e Funcional
        E possua uma mensalidade em aberto para efetuar pagamento
        E que tenha um "jwt"
        Quando uso a "senha" e efetuo a requisição 
        Então Então recebo o "status code" "200"
        E recebo "description" "SUCCESS"
        E recebo "message" "Pagamento realizado" como resposta da requisição



         


