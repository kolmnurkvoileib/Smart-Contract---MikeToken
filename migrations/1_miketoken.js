const MyToken = artifacts.require("MikeToken");

module.exports = function(deployer) {
  deployer.deploy(MikeToken);
};