
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

contract CadastroPaciente {

    // Estrutura do paciente
    struct Paciente {
        string nome;
        string cpf;
        uint256 idade;
        string endereco;
        bool existe; // Para verificar se o paciente foi cadastrado
    }
    
    // Mapping para armazenar pacientes por CPF
    mapping(string => Paciente) private pacientes;
    
    // Array para armazenar todos os CPFs cadastrados
    string[] private cpfsCadastrados;
    
    // Eventos
    event PacienteCadastrado(string cpf, string nome, uint256 idade);
    event PacienteConsultado(string cpf, string nome);
    
    // Modificador para validar se o paciente existe
    modifier pacienteExiste(string memory _cpf) {
        require(pacientes[_cpf].existe, "Paciente nao encontrado");
        _;
    }
    
    // Função para cadastrar um novo paciente
    function cadastrarPaciente(
        string memory _nome,
        string memory _cpf,
        uint256 _idade,
        string memory _endereco
    ) public {
        // Validações obrigatórias
        require(bytes(_nome).length > 0, "Nome nao pode estar vazio");
        require(bytes(_cpf).length > 0, "CPF nao pode estar vazio");
        require(_idade > 12, "Idade deve ser maior que 12 anos");
        require(!pacientes[_cpf].existe, "CPF ja cadastrado");
        
        // Criar o paciente
        pacientes[_cpf] = Paciente({
            nome: _nome,
            cpf: _cpf,
            idade: _idade,
            endereco: _endereco,
            existe: true
        });
        
        // Adicionar CPF à lista de cadastrados
        cpfsCadastrados.push(_cpf);
        
        // Emitir evento
        emit PacienteCadastrado(_cpf, _nome, _idade);
    }
    
    // Função para consultar um paciente pelo CPF
    function consultarPaciente(string memory _cpf) 
        public 
        view 
        pacienteExiste(_cpf) 
        returns (
            string memory nome,
            string memory cpf,
            uint256 idade,
            string memory endereco
        ) 
    {
        Paciente memory paciente = pacientes[_cpf];
        return (
            paciente.nome,
            paciente.cpf,
            paciente.idade,
            paciente.endereco
        );
    }
    
    // Função para verificar se um CPF já está cadastrado
    function cpfJaCadastrado(string memory _cpf) public view returns (bool) {
        return pacientes[_cpf].existe;
    }
    
    // Função para obter todos os CPFs cadastrados
    function obterTodosCPFs() public view returns (string[] memory) {
        return cpfsCadastrados;
    }

    // Função para obter o número total de pacientes cadastrados
    function totalPacientes() public view returns (uint256) {
        return cpfsCadastrados.length;
    }
    
    // Função para obter todos os pacientes (para listagem no frontend)
    function obterTodosPacientes() 
        public 
        view 
        returns (
            string[] memory nomes,
            string[] memory cpfs,
            uint256[] memory idades,
            string[] memory enderecos
        ) 
    {
        uint256 total = cpfsCadastrados.length;
        
        nomes = new string[](total);
        cpfs = new string[](total);
        idades = new uint256[](total);
        enderecos = new string[](total);
        
        for (uint256 i = 0; i < total; i++) {
            string memory cpf = cpfsCadastrados[i];
            Paciente memory paciente = pacientes[cpf];
            
            nomes[i] = paciente.nome;
            cpfs[i] = paciente.cpf;
            idades[i] = paciente.idade;
            enderecos[i] = paciente.endereco;
        }
        
        return (nomes, cpfs, idades, enderecos);
    }
}