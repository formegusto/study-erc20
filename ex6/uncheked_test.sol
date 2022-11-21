// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract uncheck_test {
    /*
    overflow, underflow가 일어나도 무시한다.
    unchecked를 사용하면 타입 확인이 들어가지 않기 때문에
    가스비용을 절약할 수 있다.
    */
    function noCheck(uint8 a, uint8 b) public pure returns (uint8) {
        // underflow or overflow => no check, ~0.8
        unchecked {
            return a + b;
        }
    }

    function yesCheck(uint8 a, uint8 b) public pure returns (uint8) {
        return a + b;
    }
}
