pragma solidity ^0.5.0;

/* Creating JointSavings contract with payable accountOne, payable accountTwo, 
address lastToWithdraw public lastWithdrawAmount and public contractBalance variables 
*/
contract JointSavings {
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;

    // Creating withdraw function that takes in uint amount and payable recipient address
    function withdraw(uint amount, address payable recipient) public {
        // Require that recipient address is accountOne or accountTwo
        require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");
        // Require that amount being withdraw is not greater than contractBalance
        require(contractBalance >= amount, "Insuficient funds!");
        // Checking last to withdraw and setting it to recipient address 
        if (lastToWithdraw != recipient) {
            lastToWithdraw = recipient;
        }
        // Tranfer amount to recipient
        recipient.transfer(amount);
        // Set lastWithdrawAmount to amount
        lastWithdrawAmount = amount;
        // Reassign contractBalance 
        contractBalance = address(this).balance;
    }

    // Creating deposit public payable function 
    function deposit() public payable {
        contractBalance = address(this).balance;
    }

    // Create public setAccounts function that take in account1 and account2
    function setAccounts(address payable account1, address payable account2) public {
        accountOne = account1;
        accountTwo = account2;
    }

    // Create fallback function to receive funds outside of the deposit function in contract
    function() external payable {}
}
