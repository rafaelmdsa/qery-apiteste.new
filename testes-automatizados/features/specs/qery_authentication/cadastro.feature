#language: pt

Funcionalidade: manutenção de conta 

    Contexto:
        
        Dado que a conta ja esteja criada
        E que tenha um "jwt"
        E preciso efetuar a manutenção de informações
        

    Cenario: consultar informações do usuario 
        Quando insiro meu "document" e efetua a requisição para buscar dados 
        Então recebo o "status code" "200"
        E recebo "description" "SUCCESS" 
        E recebo "email" email cadastrado
        E recebo "document" documento cadastrado
        E recebo "document_type" cpf ou cnpj
        E recebo "profile_image" origem de imagem 
        E recebo "phone" telefone cadastrado
        E recebo "name" nome cadastrado 
        E recebo "email_valid" true ou false como resposta da requisição

    Cenario: atualizar imagem do perfil
        Quando carego uma arquivo ".jpg" ou ".png" e efetuo a requisição 
        Então Então recebo o "status code" "200"
        E recebo "description" "SUCCESS"
        E recebo "message" "Salvo" como resposta da requisição

    Cenario: atualizar dados 
        Quando atualizo os dados de usuario 
        Então Então recebo o "status code" "200"
        E recebo "description" "SUCCESS"
        E recebo "message" "Salvo" como resposta da requisição

    Cenario: atualizar numero do documento 
        Quando atualizo os dados de numero de documento 
        Então Então recebo o "status code" "200"
        E recebo "description" "SUCCESS"
        E recebo "message" "Salvo" como resposta da requisição
