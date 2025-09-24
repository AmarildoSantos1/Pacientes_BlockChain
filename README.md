# Como Executar

## Possuir o Node 20
```bash
nvm install 20.16.0
nvm use 20.16.0
node -v   # confira que está v20.x
```
## Possuir o Node 20
```bash
npm install -g truffle
npm install
```
## Ganache
```bash
npx ganache --port 7545 --chain.chainId 1337 --wallet.totalAccounts 10 --wallet.defaultBalance 1000
```
## Contratos
```bash
truffle compile
truffle migrate --network development
```
## Teste Rápido de Porta
Se falhar, é porque o nó não está rodando na porta 7545.

Se aparecer “CONNECTION ERROR” de novo:

Confira se o Ganache está na porta 7545 e não 8545.

Mantenha Node v20.x (o uWS some).
```bash
Invoke-WebRequest http://127.0.0.1:7545 -UseBasicParsing

```



