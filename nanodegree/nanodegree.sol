pragma solidity ^0.4.23;

contract nanodegree {
    
    //NOTE!!!!!
    // Everything works great, except array push. Seems to overrule itself (store new address on top of old).
    
    // Creating an owner variable that stores what address has created this contract
    address public owner;
    
    // On construction of the contract, set owner equal to the address of the sender.
    constructor() public {
        owner = msg.sender;
    }
    
    // Create a modifier that requires that the address of the sender is equal to the owner (i.e. check if sender is owner)
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    
    /* ===== Student creation =====
    =============================*/
    
    // Create a struct variable that holds a student's information
    struct student {
        string fName;
        string lName;
        uint age;
        string email;
        string course;
        uint courseID;
        uint progress;
        uint rating;
        string review;
    }
    
    // Create a mapping named 'students' that mapps an ethereum address to a student struct
    // linking an address to a student's information
    mapping (address => student) public students;
    
    // Create an array named 'studentArr' that holds each students address.
    address[] public studentArr;
    
    
    /* ===== Instructor creation =====
    =============================*/
    
    // Create a struct variable that holds an instructor's information
    struct instructor {
        string fName;
        string lName;
        uint age;
        string email;
        string course;
        uint courseID;
    }
    
    // Create a mapping named 'instructors' that mapps and ethereum address to an instructor struct
    // linking an address to an instructor's information
    mapping (address => instructor) public instructors;
    
    // Create an array named 'instructorArr' that holds each instructor address.
    address[] public instructorArr;
    
    
    /* ===== FUNCTIONS =====
    =============================*/
    
    // Set a function named 'setStudent' that allows only the owner of the contract (using the modifier)
    // to set an address in the 'students' mapping with some values such as fName, lName, age, and email.
    function setStudent(address _address, string _fName, string _lName, uint _age, string _email) public onlyOwner {
        students[_address].fName = _fName;
        students[_address].lName = _lName;
        students[_address].age = _age;
        students[_address].email = _email;
        // Add the student address to the studentArr
        studentArr.push(_address) -1;
    }
    
    // Set a function named 'setInstructor' that allows only the owner of the contract (using the modifier)
    // to set an address in the 'instructors' mapping with some values such as fName, lName, age, and email.
    function setInstructor(address _address, string _fName, string _lName, uint _age, string _email) public onlyOwner {
        instructors[_address].fName = _fName;
        instructors[_address].lName = _lName;
        instructors[_address].age = _age;
        instructors[_address].email = _email;
        // Add the student address to the studentArr
        instructorArr.push(_address) -1;
    }
    
    // Setting a function to get student information from an ethereum address (returning some of the mapped values)
    function getStudent(address _address) public view returns (string _fName, string _lName, uint _age, string _email) {
        return (students[_address].fName, students[_address].lName, students[_address].age, students[_address].email);
    }
    
    // Setting a function to get student information from an ethereum address (returning some of the mapped values)
    function getInstructor(address _address) public view returns (string _fName, string _lName, uint _age, string _email) {
        return (instructors[_address].fName, instructors[_address].lName, instructors[_address].age, instructors[_address].email);
    }
    
}