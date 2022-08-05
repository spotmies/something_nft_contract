// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract something is ERC721A, Ownable {
    uint256 MAX_MINTS = 10;
    uint256 WL_Mints = 10;
    uint256 MAX_SUPPLY = 4444;
    uint256 public mintPrice = 0.005 ether;
    uint256 public wlMintPrice = 0.003 ether;
    uint32 public mintTime;
    uint32 public whiteListerTime;
    bool paused = false;
    address DeveloperAddress;
    uint96 royaltyFeesInBips;
    address royaltyReceiver;
    string public contractURI;
    uint256 number;
    uint256 amount;

    string public baseURI = "ipfs://OUR-IPFS-BASE-URI/";
    mapping(address => bool) public whitelisted;

    constructor(uint96 _royaltyFeesInBips, string memory _contractURI) ERC721A("Something", "Some") {
        royaltyFeesInBips = _royaltyFeesInBips;
        contractURI = _contractURI;
        royaltyReceiver = msg.sender;
    }

    function mint(uint256 quantity) external payable {
        // _safeMint's second argument takes in a quantity, not a tokenId.
            require(quantity + _numberMinted(msg.sender) <= MAX_MINTS, "You can't mint more than 10.");
            
            if(msg.sender != owner() && whitelisted[msg.sender] != true) {
                amount = quantity * mintPrice;
              if(_numberMinted(msg.sender)==0){
                  amount = amount - mintPrice;
                  require(msg.value >= amount, "Not enough ethers sent");
              }else{
                  require(msg.value >= amount, "Not enough ethers sent");
              }
           } else if(whitelisted[msg.sender] == true) {
               amount = quantity * wlMintPrice;
                  if(_numberMinted(msg.sender)==0){
                  amount = amount - wlMintPrice;
                  require(msg.value >= amount, "Not enough ethers sent");
              }else{
                  require(msg.value >= amount, "Not enough ethers sent");
              }
           }
          
            
        if(block.timestamp < mintTime) {
            require(quantity + _numberMinted(msg.sender) <= 10, "You can't mint more than 10. WL");
        }

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

    function withdraw() external payable onlyOwner {
        //Developer's stake
        uint256 ds = address(this).balance * 25 / 100;
        payable(DeveloperAddress).transfer(ds);
        
        //Owner's stake
        payable(owner()).transfer(address(this).balance);
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
