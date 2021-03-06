/*
MIT License

Copyright (c) 2019 Thibault Langlois-Berthelot

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
/*


pragma solidity >=0.4.0 <0.9.99;
import "browser/SafeMath.sol";


contract Rosa {
using SafeMath for uint256;

address payable public beneficiary;

uint256 public releaseTime;

modifier OnlyRosa {
require ( msg.sender == 0x78855021590B47eCEe86C4e158834CFD2DaB3AbC /*adress example*/ );
_;
}

constructor ( address payable _beneficiary, uint256 _releaseTime ) public payable {
require ( _releaseTime > now );
require ( _releaseTime > block.timestamp );
beneficiary = _beneficiary;
releaseTime = _releaseTime;
}

function getBalance() public view returns ( uint ) {
return address ( this ).balance;
}

function release() external OnlyRosa {
require ( block.timestamp >= releaseTime );
address ( beneficiary ).transfer ( address ( this ).balance );
}

function () external payable {

}
}
