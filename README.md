# MOIP Technical Challenge

Esse é um projeto desenvolvido para contemplar parte do comportamento de gateway(MOIP)

## Descrição

O projeto foi dividido em duas partes:

* API

Temos dois endpoints:

Um para transacionar via Cartão de Crédito e outro para gerar um boleto.

* Checkout

O checkout funciona basicamente da mesma forma que a API, porém, o usuário irá usar de um interface web para efetuar suas transações e gerar seus boletos.

### Pré-requisito

Para testar e utilizar a aplicação no ambiente local é necessário ter instalado na máquina os seguintes componentes:

* Ruby (versão 2.3.3p222)

* Rails (versão 5.1.5)

* Sqlite


### Rodando a Aplicação

O primeiro passo após a instalação é rodar bundle

```
bundle install
```

Após instalar as dependências, popule a tabela Client com alguns exemplos:

```
rails db:seed
```

Após popular a tabela Client, execute o comando para "subir" localmente a aplicação

```
rails s -b 0.0.0.0 ou rails s 
```

Quando o comando for executado e interpretado corretamente, você poderá realizar testes no checkout ou através da API

## Rodando testes

Para executar os testes é muito simples, basta executar dois comandos, são eles:

```
 rails db:migrate RAILS_ENV=test
```

e após migrate, execute os testes.

```
  bundle exec rspec
```

### Usando a API

Como foi dito anteriormente temos dois endpoints, um para boleto e outro para cartão de crédito.

* API BOLETO

URL : http://localhost:3000/api/boleto (Ambiente local)

Mensagem a ser enviada no formato json

```
{
	"transaction":{
		"client":{
			"id": 1
		},
		"buyer":{
			"name": "Diogenes",
			"email": "drabelo@gmail.com",
			"cpf": "12345678900"
		},
		"payment":{
			"amount": 123.2,
			"description": "boleto"
		}
	}
}
```

* API CREDIT CARD

URL: http://localhost:3000/api/credit_card

Mensagem a ser enviada no formato json

```
  {
	"transaction":{
		"client":{
		"id": 1
		},
		"buyer":{
			"name": "Diogenes",
			"email": "drabelo@gmail.com",
			"cpf": "12345678900"
		},
		"payment":{
			"amount": 123.2,
			"description": "credit_card",
			"card":{
				"cardHolderName": "Diogenes V M Rabelo",
				"cardNumber": "1234123412341234",
				"cardExpirationDate": "02/25",
				"cardCvv": "123"
			}
		}
	}
}
```

### Regras de negócio para transações com cartão de crédito

* Transações Aprovadas

Para enviar transações aprovadas, o usuário deve enviar transações com valor diferente de R$ 100.00, R$ 200.00, R$ 300.00 e R$ 624.00.

O retorno será um json com o result = 0

* Transações com saldo insuficiente

Enviar transações com o valor de R$ 100.00

O retorno será um json com o result = 100

* Transações com Suspeita de fraude

Enviar transações com o valor de R$ 200.00

O retorno será um json com o result = 200

* Transações com Cartão inválido

Enviar transações com o valor de R$ 300.00

O retorno será um json com o result = 300

* Transações com Cartão vencido

Enviar transações com o valor de R$ 624.00

O retorno será um json com o result = 624

## Authors

* **Diogenes Rabelo** - *Initial work* - [ChapolinIpsum](https://github.com/dvmrabelo/chapolinipsum)

## License

This project is licensed under the MIT License 

## Road Map

* Persistir status da transação
* Persistir transações negadas
* Adicionar a tag Installments
* Deixar a adição da tag Description (Tipo da transação) automática com a funcionalidade ou endpoint usado/consumido pelo usuário.
* Melhorar validações 
* Melhar testes
* Melhorar views 