pragma solidity ^0.4.23;

contract disisme {
    
    // Note: Some string types should be converted to bytes type for gas saving
    
    // Set owner of the contract
    address owner;
    constructor() public {
        owner = msg.sender;
    }
    
    // Creating a social struct that stores social information for a person
    struct Social {
        string facebookURL;
        string twitterURL;
        string githubURL;
    }
    
    //Creating a media struct that stores media links for a person
    struct Media {
        string img1;
        string img2;
        string img3;
        string img4;
    }
    
    // Creating a person struct that stores personal information and the previously presented two structs (Media & Social).
    struct Person {
        string email;
        string fName;
        string lName;
        uint age;
        string bio;
        string profilePic;
        Social social;
        Media media;
        mapping (address => bool) friends;
    }
    
    // Create a mapping that allows an ethereum address to point to a Person struct
    mapping (address => Person) public people;
    
    
    // ===============================================
    // ====== Profile creation and management ========
    // ===============================================
    
    // Allow for own profile creation by msg.sender
    function createProfile(string _fName, string _lName, uint _age, string _email, string _bio, string _profilePic) public {
        people[msg.sender].fName = _fName;
        people[msg.sender].lName = _lName;
        people[msg.sender].age = _age;
        people[msg.sender].email = _email;
        people[msg.sender].bio = _bio;
        people[msg.sender].profilePic = _profilePic;
    }
    
    // Set profile picture
    function setProfilePic(string _imageURL) public {
        people[msg.sender].profilePic = _imageURL;
    }
    
    // Set social accounts
    function setFacebook(string _url) public {
        people[msg.sender].social.facebookURL = _url;
    }
    function setTwitter(string _url) public {
        people[msg.sender].social.twitterURL = _url;
    }
    function setGitHub(string _url) public {
        people[msg.sender].social.githubURL = _url;
    }
    
    // Set email 
    function setEmail(string _email) public {
        people[msg.sender].email = _email;
    }
    
    // Set bio
    function setBio(string _bio) public {
        people[msg.sender].bio = _bio;
    }
    
    // A function that allow uploading of images
    // ...
    
    // Add a friend
    function addFriend(address _address) public {
        people[msg.sender].friends[_address] = true;
    }
    
    // Modifier that will require a msg.sender to be a friend of the person in question in order to execute the function
    modifier onlyFriends(address _address) {
        require(people[_address].friends[msg.sender] == true);
        _;
    }
    
    
    // ===============================================
    // ====== Getter functionality ===================
    // ===============================================
    
    // Get basic person info using address
    function getPersonBase(address _address) public view returns (string fName, string lName, string bio, string profilePic) {
        return (people[_address].fName, people[_address].lName, people[_address].bio, people[_address].profilePic);
    }
    
    // Get person social info using address
    function getPersonSocial(address _address) public view returns (string facebookURL, string twitterURL, string githubURL) {
        return (people[_address].social.facebookURL, people[_address].social.twitterURL, people[_address].social.githubURL);
    }
    
    // Get person email using address, only allowed if you are added as friend by that person
    function getEmail(address _address) public onlyFriends(_address) view returns (string email) {
        return (people[_address].email);
    }
}