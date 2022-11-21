// Openzeppelin, ERC20
// SPDX-License-Identifier: GPL-3.0

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
pragma solidity >=0.7.0 <0.9.0;

/*
openzeppelin-contracts
https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol


*/
contract ex5 is ERC20 {
    /*
    ERC20.constructor
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }
    */
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 _totalSupply
    ) ERC20(name_, symbol_) {
        // 1ether
        // ERC20은
        // 기본적인 decimals가 18로 잡혀있기 때문에
        // 1ether를 보내려면 10^18을 곱해서 보내주어야 한다.
        _mint(msg.sender, _totalSupply * 10**1);
    }

    function decimals() public pure override returns (uint8) {
        return 1;
    }

    /*
    openzepplin ERC20 contract에는
    내부적으로 _totalSupply와 _balances 를 보유하고 있으며,
    _mint(발행) 또한 가지고 있다.
    */
}

/*
_totalSupply : 1000000000000000000000
balanceOf로 주소 : 토큰 확인 가능
*/

/*
transferFrom

[transfer] : A -> B

[transferFrom] : A -> B, A와 B의 주소가 모두 필요
즉, C라는 대리 송금자가 있다는 것 이다.
이는 from부에 오는 송금자가 C에게 권한을 풀어주어야 한다.

[approve] : 대리송금의 양의 권한을 줄 수 있는 함수

[allownace] : 얼마나 대리송금의 양의 권한을 가지고 있는지 확인이 가능
 - owner : 대리 송금 허용자
 - spender : 대리 송금자
-> 대리송금후에는 allownance가 줄어든다.
-> 대리송금자는 자신의 가스비가 든다는 것이 함정~
*/

/*
eth Decimals 18, 10 000000000000000000
D_One Decimals 1, 10 0 ( = 10 개 D_One )
D_One Decimals 2, 10 00 ( = 10 개 D_One )
D_One Decimals 3, 10 000( = 10 개 D_One )
*/
