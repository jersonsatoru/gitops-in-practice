# Kubernetes no nosso ambiente local

## Sobre

Como configurar de forma simples e prática um cluster de kubernetes localmente.

Para tudo ocorrer de forma correta, precisamos serguir algumas convenções. Por exemplo: 


## Pré-requisitos

- Rodar num ambiente linux (de preferência Ubuntu 20.04)
- Kubectl v1.25
- Docker v20.10.16
- Kind v0.17.0 (Rodar cluster kubernetes localmente)


## Convenções
- Em cada um dos projetos, deverá existir o arquivo __Dockerfile__ em sua raiz do projeto
- Todos os projetos que o nosso k8s local irá orquestrar precisa estar dentro de uma pasta __projects__ que deverá estar junto do nosso repostório atual confirme abaixo:

```
--
  |_ k8s
  |_ projects
```


## Iniciar o nosso cluster local e o container registry local:
```sh
make create_cluster
```

## Adicionar uma API Gateway (no nosso caso o "__Kong__)
```sh
make install_kong
```

## Para gerar build das imagens e dar push para nosso container registry local:
```sh
make build_and_push
```

*Obs: Deve ser seguido a estrutura de pastas confirme as solicitado nas __Convenções__*

Esse passo irá buildar todos os projetos dentro do diretório __projects__ e dar push no nosso container registry local

## Atualizar o cluster com as imagens recém criadas/atualizadas:
```sh
make update_cluster
```

## Configurar arquivo /etc/hosts

Como estamos utilizando __ingress__ para o roteamento dos serviços, é necessário a configuração de um "domínio" ou podemos configurar o nosso arquivo de __/etc/hosts__ para atuar como nosso servidor de DNS
com a seguinte configuração:

```sh
127.0.0.1 batata.me
```

ou rodar o seguinte commando:

```sh
sudo echo 127.0.0.1 batata.me > /etc/hosts
```

Nesse projeto está sendo usado o domínio ficticio *batata.me*, mas pode ser qualquer de sua preferência, para isso, você deverá alterar os valores no arquivo */etc/hosts* e no arqiovos */k8s/ingress.yaml*

## Testar as nossas rotas criadas basta executar:
```sh
make run
```

Por padrão, a porta utilizada é a __8085__, caso queira alterar a porta basta executar o comando run desse jeito:

```sh
make run PORT=8011
```

Caso você tenha seguido os valores padrões, o nosso serviço irá subir no caminho:

[http://batata.me:8085/api/user/v1/users](http://batata.me:8085/api/user/v1/users)

ou confirme a configuração utilizada.