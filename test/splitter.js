var sleep = require('sleep');

var Splitter = artifacts.require("./Splitter.sol");


contract('Splitter', function(accounts) {
  it("should put 0 initial wei in the first account", function() {
    return Splitter.deployed().then(function(instance) {
      return instance.getBalanceOf.call(accounts[0]);
    }).then(function(balance) {
      assert.equal(balance.valueOf(), 0, "0 wasn't in the first account");
    });
  });
/*
  it("should call a function that depends on a linked library", function() {
    var meta;
    var metaCoinBalance;
    var metaCoinEthBalance;

    return Splitter.deployed().then(function(instance) {
      meta = instance;
      return meta.getBalance.call(accounts[0]);
    }).then(function(outCoinBalance) {
      metaCoinBalance = outCoinBalance.toNumber();
      return meta.getBalanceInEth.call(accounts[0]);
    }).then(function(outCoinBalanceEth) {
      metaCoinEthBalance = outCoinBalanceEth.toNumber();
    }).then(function() {
      assert.equal(metaCoinEthBalance, 2 * metaCoinBalance, "Library function returned unexpected function, linkage may be broken");
    });
  });
  */
});

