// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
  MyToken.sol - Complete ERC-20 Token for your project.
  Implements:
  - name, symbol, decimals, totalSupply
  - balanceOf, allowance
  - transfer, approve, transferFrom
  Emits:
  - Transfer
  - Approval

  Added helper functions:
  - getTotalSupply()
  - increaseAllowance()
  - decreaseAllowance()
*/

contract MyToken {
    // -----------------------------
    // Token Metadata
    // -----------------------------
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;

    // Total token supply (token * 10^decimals)
    uint256 public totalSupply;

    // -----------------------------
    // Mappings
    // -----------------------------
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    // -----------------------------
    // Events
    // -----------------------------
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // -----------------------------
    // Constructor - Mint Initial Supply to Deployer
    // -----------------------------
    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply * (10 ** uint256(decimals));
        balanceOf[msg.sender] = totalSupply;

        emit Transfer(address(0), msg.sender, totalSupply);
    }

    // -----------------------------
    // transfer(): Send tokens to another address
    // -----------------------------
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // -----------------------------
    // approve(): Allow spender to spend tokens
    // -----------------------------
    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_spender != address(0), "Cannot approve zero address");

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // -----------------------------
    // transferFrom(): Spend tokens on behalf of another address
    // -----------------------------
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Not enough allowance");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }

    // -----------------------------
    // Optional helpers
    // -----------------------------
    /// @notice Explicit getter for totalSupply (convenience)
    function getTotalSupply() external view returns (uint256) {
        return totalSupply;
    }

    /// @notice Increase allowance safely
    function increaseAllowance(address _spender, uint256 _addedValue) public returns (bool) {
        require(_spender != address(0), "Cannot increase allowance for zero address");
        allowance[msg.sender][_spender] += _addedValue;
        emit Approval(msg.sender, _spender, allowance[msg.sender][_spender]);
        return true;
    }

    /// @notice Decrease allowance safely
    function decreaseAllowance(address _spender, uint256 _subtractedValue) public returns (bool) {
        require(_spender != address(0), "Cannot decrease allowance for zero address");
        uint256 current = allowance[msg.sender][_spender];
        if (_subtractedValue >= current) {
            allowance[msg.sender][_spender] = 0;
        } else {
            allowance[msg.sender][_spender] = current - _subtractedValue;
        }
        emit Approval(msg.sender, _spender, allowance[msg.sender][_spender]);
        return true;
    }
    // Optional helper 
    function getTokenInfo() external view returns (string memory, string memory, uint8, uint256) {
        return (name, symbol, decimals, totalSupply);
    }
}