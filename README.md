# Joint Savings Contract

The goal of this project was to create a contract that can send **ETH** to either one of two savings accounts. This contract will have a withdraw function that requires that the **recipient** of the funds in the smart contract are your two savings accounts. Otherwise, funds will not be withdrawn. There is a **deposit** function and also a **fallback** function that can be used to deposit funds into the contract. There is a function to set accounts `setAccounts` that will take in two payable address `account1` and `account2` that receive savings from the smart contract. 

## Testing Contract Functionality

### Using deposit function to deposit funds
I was able to send 1 Ether, 10 Ether and 5 Ether to the contract address using the deposit function. The `contractBalance` would show the balance of the contract in wei.

![](./excecution_results/send_5_ether.png)

### Withdrawing funds to accountOne
Using the withdraw function I was able to withdraw 5 Ether to accountOne. You can confirm using lastToWithdraw, lastWithdrawAmount and contract balance to check if the withdraw was successfull.

![](./excecution_results/accountOne_5_ether.png)

### Withdrawing funds to accountTwo
I was able to withdraw 10 Ether to accountTwo. I can confirm using lastToWithdraw, lastWithdrawAmount and contract balance to check if the withdraw was successfull.

![](./excecution_results/accountTwo_10_ether.png)

## Improvements 

I would add a modifier `onlyOwner` to the contract that would require `msg.sender` owner when the deployed contract to be ther owner. Then I would add the modifier to `setAccounts` funtion.