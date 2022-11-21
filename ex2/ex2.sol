// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/*
총 4개의 변수를 필요로 한다.
    1. 토큰의 이름
    2. 토큰의 심볼
    3. 토큰의 총량
    4. 토큰의 데시멀
*/
/*
    ERC20 직접 만들기
*/
contract ex2 {
    // private로 해야 보안상 안전
    string private tokenName; // Ether
    string private tokenSymbol; // ETH
    uint256 private tokenTotalSupply; // 발행하고자하는 토큰 총량 1000
    uint256 private tokenDecimal; // 하나의 토큰에 달린 0양 1ether = 10 ^18 wei => 18

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply,
        uint256 _decimal
    ) {
        tokenName = _name;
        tokenSymbol = _symbol;
        tokenTotalSupply = _totalSupply;
        // totkenTotalSupply가 10000이고,
        // decimal이 1이면
        // 10 * 1 이기 때문에
        // 1000 {symbol}이 있는 것
        tokenDecimal = _decimal;
    }

    // getter
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
}
