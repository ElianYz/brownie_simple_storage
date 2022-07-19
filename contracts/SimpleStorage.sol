// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0; // Pour travailler avec un version supérieur à 0.6.0 mais inférieur à 0.9.0

// pragma solidity ^0.6.0 pour travailler avec toutes les versions commençant par 0.6

contract SimpleStorage {
    uint256 favoriteNumber;
    bool favoriteBool = true;
    string favoriteString = "String";
    int256 favoriteInt = 5;
    address favoriteAddress = 0x5ee04E52224ED042F007158492206c72377f1142;
    bytes32 favoriteBytes = "cat"; // ce sont les différentes variables que l'on peut stocker en solidity

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People public person = People({favoriteNumber: 2, name: "Elian"});
    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public returns (uint256) {
        // il existe aussi les keywords private, internal and external

        favoriteNumber = _favoriteNumber;
        return favoriteNumber;
    }

    // view et pure permette de ne pas effectuer de transactions sur le réseau lorsqu'on appelle la fonction
    // pure permet de faire des opérations dans une fonction et de seulement lire le résultat de cette opération, sans modifier aucun état
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    //Il faut bien indiquer ce quel type de valeur on va return
    function retrieve2() public returns (uint256) {
        favoriteNumber += 3;
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People({favoriteNumber: _favoriteNumber, name: _name}));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
