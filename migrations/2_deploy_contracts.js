var ConvertLib = artifacts.require("./ConvertLib.sol");
var Toroid = artifacts.require("./Toroid.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, Toroid);
  deployer.deploy(Toroid);
};
