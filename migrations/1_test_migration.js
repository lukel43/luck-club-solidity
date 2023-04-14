var LuckClub = artifacts.require("Club");
var ClubFactory = artifacts.require("Factory");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(ClubFactory);
  deployer.deploy(LuckClub);
};