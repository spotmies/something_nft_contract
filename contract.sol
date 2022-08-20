// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract something is ERC721A, Ownable {
    uint256 MAX_MINTS = 10;
    uint256 WL_Mints = 10;
    uint256 MAX_SUPPLY = 4444;
    uint256 public mintPrice = 0.005 ether;
    uint256 public wlMintPrice = 0.002 ether;
    uint32 public mintTime = 1660917600;
    uint32 public whiteListerTime = 1660917600;
    bool paused = false;
    address DeveloperAddress = 0xB96DfC3e4cBE9Da6F072d57c13b5EfB44c8b192C;
    address OwnerAddress = 0x2E3D02c126E75Ad3B4c95DB3A78E83044d39bf31;
    uint96 royaltyFeesInBips;
    address royaltyReceiver;
    uint256 number;
    uint256 amount;
    string contractURI;
    bytes32 public root;
    bool public checkWL;

    string public baseURI = "https://itssomethingnft.mypinata.cloud/ipfs/QmRqbzdQ9GiHcLjm7EfzyYQ1NrjvBCdhfaqXPuR56WKm46/";
    mapping(address => bool) public whitelisted;

    constructor(uint96 _royaltyFeesInBips, string memory _contractURI, bytes32 _root) ERC721A("It'sSomething", "SOMETHING") {
        royaltyFeesInBips = _royaltyFeesInBips;
        contractURI = _contractURI;
        root = _root;
        royaltyReceiver = msg.sender;
    }

    function mint(uint256 quantity, bytes32[] memory proof, bytes32 leaf) external payable {
        // _safeMint's second argument takes in a quantity, not a tokenId.
           require(quantity + _numberMinted(msg.sender) <= MAX_MINTS, "You can't mint more than 10.");
           require(keccak256(abi.encodePacked(msg.sender)) == leaf, "You are not genuine"); 
           
           checkWL = MerkleVerify(proof, leaf);

           if(checkWL) {
               amount = quantity * 0.002 ether;
               if(_numberMinted(msg.sender) == 0) {
               amount = amount - 0.002 ether;
           }
           } else {
               amount = quantity * 0.005 ether;
               if(_numberMinted(msg.sender) == 0) {
               amount = amount - 0.005 ether;
           }
               
           }

            require(msg.value >= amount, "Not enough ethers sent");
        // if(block.timestamp < mintTime) {
        //     require(block.timestamp >= mintTime,"Mint not yet started");
        // }

        require(totalSupply() + quantity <= MAX_SUPPLY, "Not enough tokens left");

        if(block.timestamp >= whiteListerTime) {
            require(block.timestamp >= whiteListerTime, "whitelist time not yet started.");
            paused = true;
        }

        require(paused, "Wait till mint time starts.");
        
        if(msg.sender != owner()){
          if(whitelisted[msg.sender] != true) {
               require(block.timestamp >= mintTime, "Wait till public mint time starts.");
          }
        }

        _safeMint(msg.sender, quantity);
    }

    function MerkleVerify(bytes32[] memory proof, bytes32 leaf) public view returns (bool) {
        return MerkleProof.verify(proof, root, leaf);
    }

    function addRootHash(bytes32 _root) public onlyOwner {
        root = _root;
    }

    function ChangeOwner(address _OwnerAddress) public onlyOwner {
        OwnerAddress = _OwnerAddress;
    }

    function withdraw() external payable onlyOwner {
        //Developer's stake
        uint256 ds = address(this).balance * 25 / 100;
        payable(DeveloperAddress).transfer(ds);
        
        //Owner's stake
        payable(OwnerAddress).transfer(address(this).balance);
    }

    function setWLTimer(uint32 _whitestamp) public onlyOwner {
       whiteListerTime = _whitestamp;
    }

    function setTimer(uint32 _stamp) public onlyOwner {
        mintTime = _stamp;
    }

    function whitelistUser(address _user) public onlyOwner {
        whitelisted[_user] = true;
    }

     function removeWhitelistUser(address _user) public onlyOwner {
        whitelisted[_user] = false;
    }
    
    ////////////////////////////////
     // Royalty functionality
    ///////////////////////////////
    
    function supportsInterface(bytes4 interfaceId) public view override(ERC721A) returns (bool) {
        return interfaceId == 0x2a55205a || super.supportsInterface(interfaceId);
    }
    
    function royaltyInfo(uint256 _tokenId, uint256 _salePrice) external view returns (address receiver, uint256 royaltyAmount) {
         return (royaltyReceiver, calculateRoyalty(_salePrice));
    }
    
    function calculateRoyalty(uint256 _salePrice) view public returns (uint256) {
         return (_salePrice / 10000) * royaltyFeesInBips;
    }
    
    function setRoyaltyInfo(address _receiver, uint96 _royaltyFeesInBips) public onlyOwner {
         royaltyReceiver = _receiver;
         royaltyFeesInBips = _royaltyFeesInBips;
    }
    
    function setContractUri(string calldata _contractURI) public onlyOwner {
         contractURI = _contractURI;
    }

///////////////////////////////////////////

    function setStakeAddress(address _developer) public onlyOwner {
        DeveloperAddress = _developer;
        // PartnerAddress = _partner;
    }

    function suppliedNFTs() public view returns(uint256) {
        return totalSupply();
    }

    function userMint() public view returns(uint256) {
        return _numberMinted(msg.sender);
    } 

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function setBaseURI(string calldata _baseURI) public onlyOwner {
         baseURI = _baseURI;
    }
}