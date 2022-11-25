# Kubernetes no nosso ambiente local

## Sobre

Como configurar de forma simples e prática um cluster de kubernetes localmente.

Para tudo ocorrer de forma correta, precisamos serguir algumas convenções. Por exemplo: 

- Todos os projetos que o nosso k8s local irá orquestrar precisa estar dentro da __projects__ 
- Em cada um dos projetos,deverá existir o arquivo __Dockerfile__ em sua raiz do projeto
- Também será necessário o diretório __k8s__ com os arquivos de __deployment.yaml__ e __service.yaml__ dentro dele
- Cada um dos projetos precisará adicionar as configurações de ingress que se encontra no diretório __k8s__ que fica na raiz do repositório


## Pré-requisitos

- linux
- kubectl v1.25
- docker v20.10.16
- kind v0.17.0

## Iniciar o nosso cluster local e o container registry local:
```sh
make create_cluster
```

## Adicionar nossa API Gateway (no nosso caso o "__Kong__)
```sh
make install_kong
```

## Como gerar o build das imagens e dar push para nosso container registry local:
```sh
make build_and_push
```

Esse passo irá buildar todos os projetos dentro do diretório __projects__ e dar push no nosso container registry local

## Como atualizar o cluster com as imagens recém criadas/atualizadas:
```sh
make update_cluster
```

## Para testar as nossas rotas criadas basta  executar:
```sh
make run
```

Por padrão, a porta utilizada é a __8085__, caso queira alterar a porta basta executar o comando run desse jeito:

```sh
make run PORT=8011
```

O nosso serviço irá subir no caminho:

[http://batata.me:$PORT/api/user/v1/users](http://batata.me:$PORT/api/user/v1/users)

__IMPORTANTE:__ para acessar o serviço com o link acima, será necessario adicionar essa linha de código abaixo no seu arquivo de hosts (__/etc/hosts__):

```sh
127.0.0.1 batata.me
```

ou rodar o seguinte commando:

```sh
sudo echo 127.0.0.1 batata.me > /etc/hosts
```

### Made with 💚 in Go.K
