pragma solidity ^0.4.0;

import "./zeppelin/token/ERC20/StandardToken.sol";
import "./zeppelin/math/SafeMath.sol";

/**
 * ERC20 токен владение которым гарантирует возможность покупки ambuy token
 * @author Ivanov D.V. (ivanovdw@gmail.com)
 *         Date: 17.05.2018
 */
contract ReservAmbuyToken is StandardToken {
    using SafeMath for uint256;

    string public constant name = "Reserve Ambuy Token";
    string public constant symbol = "RAT";
    uint8 public constant decimals = 0;

    uint256 public constant INITIAL_SUPPLY = 50000;

    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        emit Transfer(0x0, msg.sender, INITIAL_SUPPLY);
    }
}