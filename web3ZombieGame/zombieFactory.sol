// SPDX-License-Identifier: MIT 
pragma solidity >=0.4.16 <0.9.0;

contract ZombiFactory{

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie{
        uint dna;
        string name;
    }

    Zombie[] public zombies;
}
