pragma solidity ^0.8.0;

contract MyToken {
    string public name = "MikeToken";
    string public symbol = "MTK";
    uint256 public totalSupply = 999;
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    //balanceOf trackib igat addressi kes hoiab minu tokenit

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    //transfer laseb tokenite owneritel saata tokeneid teistele addressidele, aga saatjal peab olema piisavalt tokeneid fee jaoks

    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }

    //burn function vaja tokeneid et burnida tokeneid :D

    function burn(uint256 _value) public {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
    }
}