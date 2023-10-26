# **Tutorial: Atividade Docker BackEnd**

## **1 Criar uma instância EC2 na AWS**
![image](https://github.com/GVS22/backLaboratorioSO/assets/54191675/18fbe448-d36c-4359-950c-60f21e0b4000)
![image](https://github.com/GVS22/backLaboratorioSO/assets/54191675/c8a31d4f-1349-4303-9b19-0e613593cbf4)

### Aqui você precisará criar um novo par de chaves, que basicamente é um arquivo de certificado de segurança que permite que você se conecte à sua instância EC2 a partir da sua máquina, chamado Par de Chaves ou Chave Privada.

![image](https://github.com/GVS22/backLaboratorioSO/assets/54191675/f09cf387-058f-425d-84da-219f67b1f971)

-Importante!!!
Faça o download deste Par de Chaves e certifique-se de lembrar onde o salvou, pois você precisará usá-lo para se conectar à instância EC2.

## **2.Conectar e acessar remotamente a instância EC2.**

![image](https://github.com/GVS22/backLaboratorioSO/assets/54191675/f669dc25-0964-48b0-b88d-5d482abc654a)
![image](https://github.com/GVS22/backLaboratorioSO/assets/54191675/ec0e1cdb-fe0b-4287-a763-336339f6485d)

- Importante !!! Certifique-se de ter usado o comando chmod 400 para atualizar o acesso no certificado.

Para se conectar à instância EC2, você precisará usar o seguinte comando, mas esteja atento ao nome e localização do seu Par de Chaves ou Chave Privada (por exemplo, minha Chave Privada está no mesmo projeto).

Com base no exemplo fornecido na janela pop-up, deve ser algo assim:
  ```bash
    $ ssh -i “new-key-pair.cer” ubuntu@ec2–54–210–98–114.compute-1.amazonaws.com
  ```

## **3.Uma vez conectado, instale o Node, NPM e o Docker na instância EC2.**
#### Esta linha instala o curl no servidor Ubuntu
```bash
   $ sudo apt-get install curl
   ```

#### Esta linha faz o download do Node.js
```bash
   $ curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
   ```

#### Esta linha instala o node
```bash
   $ sudo apt-get install nodejs
   ```
### **. Instalação do Docker no Linux**

- #### Atualize seus pacotes:
   ```bash
   sudo apt-get update
   ```

- #### Instale as dependências necessárias:
   ```bash
   sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
   ```

- #### Adicione a chave GPG oficial do Docker:
   ```bash
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   ```

- #### Adicione o repositório do Docker:
   ```bash
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   ```

- #### Atualize novamente seus pacotes:
   ```bash
   sudo apt-get update
   ```

- #### Instale o Docker:
   ```bash
   sudo apt-get install docker-ce
   ```

- ### Inicie e habilite o serviço Docker:
   ```bash
   sudo systemctl start docker
   sudo systemctl enable docker
   ```

###  **Instalação da Imagem MySQL**

- ### Puxe a imagem oficial do MySQL para o Docker:
   ```bash
   docker pull mysql
   ```
## Clone a seu repositório do GitHub (da EC2)
. Clone o código de seu GitHub para a sua instância Ubuntu EC2 usando o link HTTPS, não o SSH.

### Execute este comando enquanto estiver conectado à sua instância EC2
   ```bash
   ubuntu@ip-172-31-90-127 $ git clone 'seu link de repositório'
   ```
- #### Instale todas as dependências, entrando na pasta clonada e normalmente utilizando 
  ```bash
   npm install
   ```

##  **. Inicialização**

- ### Inicie o banco de dados MySQL:
   ```bash
   sudo docker run --name mysql-container -d -v /var/lib/mysql -p 4000:4000 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=lab_so -e MYSQL_USER=lab_so -e MYSQL_PASSWORD=root mysql
   ```

- ### Carregue os dados no banco de dados:
   ```bash
   cat ./BD/base_cardapio.sql | docker exec -i mysql-container mysql -ulab_so -proot lab_so
   ```

- ### Construa a imagem Docker:
   ```bash
   sudo docker build -t api-image .
   ```

- ### Execute o contêiner Docker:
   ```bash
   sudo docker run -p 4000:4000 --link mysql-container -v $(pwd):/usr/app --name api-container api-image
   ```
## Permita o acesso à sua instância EC2 através da porta.
![image](https://github.com/GVS22/backLaboratorioSO/assets/54191675/4f272756-619e-4bf1-8e5c-dff2bc767aab)
![image](https://github.com/GVS22/backLaboratorioSO/assets/54191675/d1d227c1-5a92-464a-baeb-87454debd9b5)

#Contato
Gabriel Vitor Silva - mygabriel0@gmail.com

