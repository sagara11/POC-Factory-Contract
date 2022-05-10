const hre = require("hardhat");
async function main() {
  const Foundation= await hre.ethers.getContractFactory("Foundation");
  const foundation= await Foundation.deploy();
  await foundation.deployed();
  console.log("Foundation contract deployed to: ", foundation.address);
}