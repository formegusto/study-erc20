// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract ex4 {
    string private tokenName; // Ether
    string private tokenSymbol; // ETH
    uint256 private tokenTotalSupply; // 발행하고자하는 토큰 총량 1000
    uint256 private tokenDecimal; // 하나의 토큰에 달린 0양 1ether = 10 ^18 wei => 18

    // 해당 contract 사용자들의 주소 및 가지고 있는 토큰 개수
    mapping(address => uint256) private balances;

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply,
        uint256 _decimal
    ) {
        tokenName = _name;
        tokenSymbol = _symbol;
        tokenDecimal = _decimal;

        mint(msg.sender, _totalSupply);
    }

    function name() public view returns (string memory) {
        return tokenName;
    }

    function symbol() public view returns (string memory) {
        return tokenSymbol;
    }

    function totalSupply() public view returns (uint256) {
        return tokenTotalSupply;
    }

    function decimal() public view returns (uint256) {
        return tokenDecimal;
    }

    function balanceOf(address _addr) public view returns (uint256) {
        return balances[_addr];
    }

    function mint(address _addr, uint256 amount) internal virtual {
        balances[_addr] += amount;
        tokenTotalSupply += amount;
    }

    event _transfer(address from, address to, uint256 amount);

    function transfer(address _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Too much to send tokens");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;

        emit _transfer(msg.sender, _to, _amount);
    }
}
