// SPDX-License-Identifier: GPL-3.0

/*
ERC20(Ethereum Request for Comment 20)?
EIP (Ethereum Improvement Proposal)
    - 이더리움 블록체인 네트워크의 표준 smart contract
    - 이더와 같이 대부분의 토큰은 ERC20 smart contract based
    - 대체 가능한 토큰
        ex )
        Alice의 100원은 Bob의 100원
        Alice의 1토큰은 Bob의 1토큰
    
    단점
    - Fallback 함수 지원 x -> 토큰의 유실 가능성 (smart contract로 토큰을 보낼 시)
    - ERC20의 보완버전 -> ERC223, ERC777 (contract에 토큰 X, Fallback 함수 지원)
*/
pragma solidity >=0.7.0 <0.9.0;

contract ex1 {}
