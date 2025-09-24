# Cadastro de Pacientes em Blockchain
Este projeto implementa um sistema de cadastro de pacientes utilizando Ethereum (Ganache), Truffle e
uma interface web (HTML + Web3.js).

# Requisitos:
```bash
Node.js (>= 18)
Truffle
Ganache (GUI ou CLI)
```
# Como Executar
## Instale as Dependências Globais
```bash
npm install -g truffle
npm install -g ganache
```
# Clone o repositório e entre na pasta:

```bash
git clone <url-do-repo>
cd C:\Blockchain
```

# Instale dependências locais:
```bash
npm install
```
#Abra o Ganache:
##GUI → a rede local usa 127.0.0.1:7545
##CLI → rodar ganache-cli -p 8545

# Compile os Contratos
```bash
npx truffle compile
```

# Agore Migre o contrato (deploy) dos contratos
```bash
npx truffle migrate --reset --network development
```
##Se configurado corretamente no truffle-config.js, você verá no console algo como:
```bash
Deploying 'CadastroPaciente'
 > contract address: 0x123456789abcdef...
Esse é o endereço do contrato implantado.
```
# Cole o Contrato em Index.html
```bash
 O do console irá ser inserido em   <input id="contractAddress" placeholder="0xA13956f0A89487506c662512833C272Dd8C60122" /> no index.html
```
# Usar a interface Web
 
##Abra o index.html com Live Server (VS Code) ou rode:
```bash
npx serve .
```
#Conecte a MetaMask na rede Ganache (usar http://127.0.0.1:7545). Cole o endereço do contrato exibido
na migração.

##Agora é possível cadastrar e consultar pacientes pela interface.

###Observações:
O arquivo truffle-config.js já está configurado para development (Ganache).
Se usar ganache-cli, troque a porta no config de 7545 para 8545.
O projeto foi desenvolvido com Solidity 0.8.20, ajuste se necessário.





