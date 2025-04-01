// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SavingsVault {
    // Mapping to track the Ether balance of each user
    mapping(address => uint256) private balances;

    // Function to deposit Ether into the vault
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value; // Increase the user's balance
    }

    // Function to withdraw Ether from the vault
    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdraw amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount; // Decrease the user's balance
        payable(msg.sender).transfer(amount); // Transfer Ether back to the user
    }

    // Function to check the balance of the caller
    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
