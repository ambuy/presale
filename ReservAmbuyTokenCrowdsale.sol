pragma solidity ^0.4.0;

import "./zeppelin/math/SafeMath.sol";
import "./zeppelin/crowdsale/Crowdsale.sol";
import "./zeppelin/ownership/Ownable.sol";
import "./ReservAmbuyToken.sol";

/**
 * Продажа Reserv Ambuy Token
 * @author Ivanov D.V. (ivanovdw@gmail.com)
 *         Date: 17.05.2018
 */
contract ReservAmbuyTokenCrowdsale is Crowdsale, Ownable {
    using SafeMath for uint256;

    bool public isFinalized = false;
    event Finalized();

    modifier onlyWhileOpen {
        require(isFinalized);
        _;
    }

    function ReservAmbuyTokenCrowdsale() Crowdsale(4000000000000000,
                                         0x10101E70fBac986356fCD2c9772cD30fEAb0d203,
                                         new ReservAmbuyToken()) {
    }

    function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256) {
        return _weiAmount.div(rate);
    }

    function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal onlyWhileOpen {
        super._preValidatePurchase(_beneficiary, _weiAmount);
    }

    function finalize() onlyOwner public {
        require(!isFinalized);
        emit Finalized();
        isFinalized = true;
    }
}