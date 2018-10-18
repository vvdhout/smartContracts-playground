pragma solidity ^0.4.23;

contract startup {
    
    string public idea;
    address public ceo;
    address public cfo;
    address public coo;
    int public profitPerMonth;
    int public cash;
    string public messageReturned;
    
    constructor() public {
        ceo = msg.sender;
        idea = "Just an idea. On a napkin.";
        cash = 500;
    }
    
    function setCEO(address newCEO) public returns (string message){
        if (msg.sender != ceo) {
            messageReturned = "You do not have permission to set a CEO for this startup.";
            return messageReturned;
        }
        else {
            ceo = newCEO;
        }
    }
    
    function getCEO() public view returns (address) {
        return ceo;
    }
    
    function setCFO(address newCFO) public returns (string message){
        if (msg.sender != ceo) {
            messageReturned = "You do not have permission to set a CEO for this startup.";
            return messageReturned;
        }
        else {
            cfo = newCFO;
        }
    }
    
    function getCFO() public view returns (address) {
        return cfo;
    }
    
    function setCOO(address newCOO) public returns (string message){
        if (msg.sender != ceo) {
            messageReturned = "You do not have permission to set a CEO for this startup.";
            return messageReturned;
        }
        else {
            coo = newCOO;
        }
    }
    
    function getCOO() public view returns (address) {
        return coo;
    }
    
    function changeIdea(string newIdea) public returns (string message) {
        if (msg.sender != ceo) {
            messageReturned = "You do not have permission to change the idea for this startup.";
            return messageReturned;
        }
        else {
            idea = newIdea;
        }
    }
    
    function getIdea() public view returns (string) {
        return idea;
    }
    
    function invest(int cashIn) public {
        cash = cash + cashIn;
    }
    
    function viewCash() public view returns (int) {
        return cash;
    }

    
}