// Right click on the script name and hit "Run" to execute
const { expect } = require("chai");
const { ethers } = require("hardhat");

import "remix_tests.sol";
import "remix_accounts.sol";

describe("WatchTrader", function () {
  //TEST 1: Deploy
  it("deployed successfully", async function () {
    const WatchTrader = await ethers.getContractFactory("WatchTrader");
    const trader = await WatchTrader.deploy();
    await trader.deployed();
  });

  //TEST 2: Listing
  it("test listing functionality", async function () {
    const WatchTrader = await ethers.getContractFactory("WatchTrader");
    const trader = await WatchTrader.deploy();
    await trader.deployed();

    const WatchItems = await ethers.getContractFactory("WatchItems");
    const items = await WatchItems.deploy();
    await items.deployed();
    await items.setApprovalForAll(trader.address,true);

    const trader2 = await ethers.getContractAt("WatchTrader", trader.address);
    const setValue = await trader2.addListing(1000000, items.address, 0);
    await setValue.wait();
    expect((await trader2.listings(items.address, 0)).price).to.equal(1000000);
  });

  //TEST 3: Purchase
  it("test purchase functionality", async function () {
    const WatchTrader = await ethers.getContractFactory("WatchTrader");
    const trader = await WatchTrader.deploy();
    await trader.deployed();

    const WatchItems = await ethers.getContractFactory("WatchItems");
    const items = await WatchItems.deploy();
    await items.deployed();
    await items.setApprovalForAll(trader.address,true);

    const trader2 = await ethers.getContractAt("WatchTrader", trader.address);
    await trader2.addListing(1000000, items.address, 0);

    const myPurchase = await trader.purchase(items.address, 0, 0);
  });

  //TEST 4: Withdrawal
  it("test withdrawal functionality", async function () {
    const WatchTrader = await ethers.getContractFactory("WatchTrader");
    const trader = await WatchTrader.deploy();
    await trader.deployed();

    const trader2 = await ethers.getContractAt("WatchTrader", trader.address);
    await trader2.withdraw(100000, trader.address);
  });
});