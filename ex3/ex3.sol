// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract ex3 {
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

        // tokenTotalSupply = _totalSupply;
        // balances[msg.sender] = _totalSupply;
        // 해당 contract 생성자는
        // token n개를 발행한 후 가지고 있다.
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

    // token smart contract에는 mint라는 함수가 있는데,
    // token을 새롭게 발행하는 함수이다.
    // internal을 붙여준 이유는
    // 다른 smart contract에게 상속을 받을 수 있기 때문이다.
    // internal은 상속을 받으면 자식도 사용이 가능하다.
    function mint(address _addr, uint256 amount) internal virtual {
        balances[_addr] += amount;
        tokenTotalSupply += amount;
    }
}
