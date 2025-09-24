const CadastroPaciente = artifacts.require("CadastroPaciente");

module.exports = function(deployer){
    deployer.deploy(CadastroPaciente, "CadastroPaciente");
};