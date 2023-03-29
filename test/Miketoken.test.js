const MikeToken = artifacts.require("MikeToken");

contract("MikeToken", accounts => {
  it("should transfer tokens between accounts", async () => {
    const MikeToken = await MikeToken.deployed();
    const sender = accounts[0];
    const recipient = accounts[1];
    const amount = 100;
    const initialSenderBalance = await MikeToken.balanceOf(sender);
    const initialRecipientBalance = await MikeToken.balanceOf(recipient);
    await MikeToken.transfer(recipient, amount, { from: sender });
    const finalSenderBalance = await MikeToken.balanceOf(sender);
    const finalRecipientBalance = await MikeToken.balanceOf(recipient);
    assert.equal(finalSenderBalance, initialSenderBalance - amount, "Sender balance incorrect");
    assert.equal(finalRecipientBalance, initialRecipientBalance + amount, "Recipient balance incorrect");
  });
});