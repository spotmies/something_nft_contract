// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract something is ERC721A, Ownable {
    uint256 MAX_MINTS = 10;
    uint256 WL_Mints = 10;
    uint256 MAX_SUPPLY = 4444;
    uint256 public mintPrice = 0.005 ether;
    uint256 public wlMintPrice = 0.002 ether;
    uint32 public mintTime = 1660815957;
    uint32 public whiteListerTime = 1660815597;
    bool paused = false;
    address DeveloperAddress = 0xB96DfC3e4cBE9Da6F072d57c13b5EfB44c8b192C;
    address OwnerAddress;
    uint96 royaltyFeesInBips;
    address royaltyReceiver;
    uint256 number;
    uint256 amount;
    string contractURI;

    string public baseURI = "ipfs://OUR-IPFS-BASE-URI/";
    mapping(address => bool) public whitelisted;

    constructor(uint96 _royaltyFeesInBips, string memory _contractURI) ERC721A("Something", "Some") {
        royaltyFeesInBips = _royaltyFeesInBips;
        contractURI = _contractURI;
        royaltyReceiver = msg.sender;
        
        whitelisted[0x6182c554EfbAf57C4742b55C0387eA1d890E4384] = true;
whitelisted[0x9C9575Bea7F25a3eCBAa962d1aafCFab1166c7B2] = true;
whitelisted[0x1d935f516D5008Ff3153ab789258Bf5d8cF604f5] = true;
whitelisted[0xeA35A3B01CB0ED383c6182F308373d519d0d6350] = true;
whitelisted[0xaE54AEF2B2cbd086e22A743Dbc04830038bb53aD] = true;
whitelisted[0x183489d0725fE0b0cE6777A6C5C4Ff413245660e] = true;
whitelisted[0xAc607b4865807aF1FC429ed60DBb76d008b2eDD5] = true;
whitelisted[0x8124eE103C3694Dc0C7C6EFadAEd0a08f63908DD] = true;
whitelisted[0x3EAbD83cF5E16cf568d6e6eD5D1f9fbB15E26ED8] = true;
whitelisted[0xEdAa60CC3F50c33e7222221f2d5aD3bc96d5FCfB] = true;
whitelisted[0x8586F84717710939158C22fb23A73a2D24CA4627] = true;
whitelisted[0xb442d26D2b0848E4782cfd7553EE75497f897CCA] = true;
whitelisted[0xAaB95C9763ae7238D7126Ed515C9e2773Ba364a7] = true;
whitelisted[0xc358cAA3817Ba7906F9C3bCc1bb34e793492D113] = true;
whitelisted[0xb20A0377D565F2AeAb8c910e935774914E58f4a8] = true;
whitelisted[0x3A0626d8c474598970D9500bE3FE7469920B291F] = true;
whitelisted[0xAd38Ae28aa9E9d3DC6Aca67689cdcaeDec552891] = true;
whitelisted[0x0Fe6253081cfFAFddAf88a7f4c84Db054ecA62cb] = true;
whitelisted[0x71bF5d70C666A378710C1B53b37728374609bc28] = true;
whitelisted[0xA54f0264bEef86F8Ce13cA1C7e0CFCFC39b69Fc0] = true;
whitelisted[0x7ADb4B33B61E130682dE222402FD30108Dc6b91B] = true;
whitelisted[0xd08A0E5c4faf114880A732C1E951D8fE56839118] = true;
whitelisted[0xd60368e6Aa1dC823544603c69b55e98a87db52f4] = true;
whitelisted[0x72cB4f4D34208B27a6c05a5D220f8A5BDe364B13] = true;
whitelisted[0xB77AC3e00280B7694AEB321A1bf69abAd4c985e6] = true;
whitelisted[0xa7c127E10746b2C9D6CBffec1453DDaA77535741] = true;
whitelisted[0x8Bb42B7e6730a1BE65C5a10a6ae337670314EcA7] = true;
whitelisted[0x3980570A363abb02DB657440dD6A9A8bd677563e] = true;
whitelisted[0x4363A6EE36F9184b7f8CCDd1A737a79d69ff3F8D] = true;
whitelisted[0xf9E4A219F9982a76804f0111219A04bb96901ece] = true;
whitelisted[0x10f227713a06aAb880010a9e4acdDEaCD783f148] = true;
whitelisted[0x0A4f72C6dD349E2e1e07279d29274426698C4C83] = true;
whitelisted[0x5AF138EFC8Ae6BF1779688E0Aa09d1fA8bab6FeB] = true;
whitelisted[0x4Dc991Ad6B669a9b2EBebadcED8DC990ca9E2914] = true;
whitelisted[0x6fB01209683ecf8c0D8d10198ae3fbe4B4576Bb5] = true;
whitelisted[0xA4A1177fbCEf56a8Cc3292D6496Cb37caE4C2803] = true;
whitelisted[0x7A6ea096d2dEf4265d70C4e1FAAd49817592375f] = true;
whitelisted[0xCE2461C6c8B7Ed3eb2cB6DbBb6E86716883AaC8c] = true;
whitelisted[0xa8C1604A552b1A0CdD005cFd04fc19F59783385b] = true;
whitelisted[0x4bae8fB39b25D1ae07409d90C38D1c082f62AE84] = true;
whitelisted[0xc09956866623Ac5c49cb543634b0a38a6Eeaa862] = true;
whitelisted[0xC298fD9Dbf1f1198dfF32C59Eaa953Dc04512286] = true;
whitelisted[0xE728c748949388d7bee023AFF861219ad8847c07] = true;
whitelisted[0x33eE12FB80A1b2C0F542F5787DcAeDe2A7cB1238] = true;
whitelisted[0x382DB824e89dc8244d5c507Ac484b86E28c0367e] = true;
whitelisted[0x631ea4C09AC157B14A00b28dEEd819b9a65D49a6] = true;
whitelisted[0xd5b71A4f3D38eA2c8F4f28D3F136F426A686EfdF] = true;
whitelisted[0x4eaB2c2EC34BeC9654bc819c84d61E718e8B0009] = true;
whitelisted[0xf178de4DB511B325E33ce8A6C5B377c204984751] = true;
whitelisted[0x9B472bC59E8003088c7a04f00bA8ba2b313a4ffa] = true;
whitelisted[0x22ea0c4F53E8b169dB2774Bc91322b4241207faB] = true;
whitelisted[0xCB88C4BC82eD2d81F3C4d58771b2445d2Eb95B31] = true;
whitelisted[0x6961B4e30aE3e17DB8c8893fE7A5323ce0EBfA63] = true;
whitelisted[0xB8De722c4F2Ffa11bfddAf1D50421cA308FAf347] = true;
whitelisted[0x4Eb00FdF5F18d3d551cE52b2dc2F19362AeAAa30] = true;
whitelisted[0xC7518a8CF15811ba98924Fbfd054Cb0ec9397e9E] = true;
whitelisted[0x78558458DfA43CCF87b5458D456268AD7F974dC0] = true;
whitelisted[0x1de6c16eD0BBdc7bB7F82a176075ca9568097384] = true;
whitelisted[0x5273f37868E6e876B1a4bA481d2716aCd23e2304] = true;
whitelisted[0x7A621b08ee71C93cCFB2b034dd0F959F891a3675] = true;
whitelisted[0x4187bC90F92d790cEdbfB93317Ed862bdd28aA59] = true;
whitelisted[0xEDa3c590b8A150b506C0041019d630DbE7C45017] = true;
whitelisted[0x93a6f0F5a253C2a6AB812cb6246Fb1d1D2D9Fc7F] = true;
whitelisted[0x96F145A70638957060816a7845bD4159561A230C] = true;
whitelisted[0x27460Fd020ae1985Ff2C3112B4A1376E6A8FCc6F] = true;
whitelisted[0xBe3580aB017137B827c7DCb4803Cb35ec112bF1A] = true;
whitelisted[0x86C3d1159c547d5eDe1f2EE3eA4DC88Ce2228626] = true;
whitelisted[0x7F01511163924cB55A62781f20D4ADfCC7e2eF57] = true;
whitelisted[0x62Cd3Da32eaCB59E13a51E4f61D2295dfC19fC29] = true;
whitelisted[0xacEd3eeab912C898455C4a7e4697b21C3E943601] = true;
whitelisted[0xDd82Ab9E866B8E2e2Ea2DEF9A49EFc9A006c8392] = true;
whitelisted[0x3bc232768C62eA03ED2cbDc9315223d1dF820f64] = true;
whitelisted[0xAA22Bf3D4c959d3903290606ba07357a2f5a33d6] = true;
whitelisted[0x7fcdaC15Bff646749b575bf97afbc2de3C61D390] = true;
whitelisted[0xA1184Ce5b313C55D61458BDA95365df20ac38c98] = true;
// whitelisted[0x27253E5F90F37A0d70057beE690814581A70A19] = true;
whitelisted[0x28FfE7F5ae14E2222e857460814BfA1Ad60Fe67f] = true;
whitelisted[0x27648F043dB2D513ae27dC3CeA1bC58684d746AA] = true;
whitelisted[0x36533179AbeB0F21066AbcAaEa369EF5832243E8] = true;
whitelisted[0xf93780da085b70B1968b471c96177C153dc4Bb6D] = true;
whitelisted[0xC1B2A0ce7E2A7febefE625EFF16AFb1Af1973a20] = true;
whitelisted[0x1B82180fBC35667F107BA602f242F175C76cA353] = true;
whitelisted[0xF08c45304f4241033b507665B2Fc865688ac2f02] = true;
whitelisted[0x915e070BD89Efd5802aE7f5eE03294146D44F0FA] = true;
whitelisted[0x255476136138143053Cd4fD0616009D8bDb98D63] = true;
whitelisted[0x325871d0EF3F27c4f837c4714aE5C2ba5B543425] = true;
whitelisted[0xcFD3cB7254f8653945FC9e719991C1dcB3a0c6B2] = true;
whitelisted[0x00e51D3FF753DB5870f18A638F5eDEf16F407D25] = true;
whitelisted[0x31d70eE77BFd82DD621afbb9d32F2DC9f99487cA] = true;
whitelisted[0xF38A42a7f678c9506962b6071B0137F1A0C872c5] = true;
whitelisted[0xbF8CD0590a4B7C26cA64dd15489DF273b19839d8] = true;
whitelisted[0x446D327484f6Ac3D4197f0d0dB31BBdf0e1EeE01] = true;
whitelisted[0x69fD02C1Cf7659D3D095c4Ce73B5d5C23886B5f6] = true;
whitelisted[0x89DF1AF8600af226Df87D01ce4eee7E5c0Cc1642] = true;
whitelisted[0xa5BE60342CAe79d55ae49d3a741257a9328a17EA] = true;
whitelisted[0x4B32a6e3A4DEF25F9fE74771B3b64A4E9eaF3735] = true;
whitelisted[0x1AfFAB98a4B680AEaa223c0032E8e954C54160df] = true;
whitelisted[0x2B9d9aeDdA825193cC7eBD512ab6e0fB485FA5E1] = true;
whitelisted[0x487BCD3C93897891213bb5cC80a2f93557aAE8F4] = true;
whitelisted[0xc6364EE3D027C73F340B375D7ca657970D0eBe3b] = true;
whitelisted[0x11212242Ba29E3544b7FE2Bd18ae328914b0eC5e] = true;
whitelisted[0x54b9df921a79342830729b6b14DFE96b02E2AeDe] = true;
whitelisted[0x9174776085365154CF6893F7088008CEd8C0A826] = true;
whitelisted[0xF377817928788812Df99eb961b92f4De0F2496f0] = true;
whitelisted[0x59c110b170c44BB4f0eaEFDEeFbf4D75CB3Ea05D] = true;
whitelisted[0x282B31c6e80BFaA6EbDea08Ab9639F5A5257DAB7] = true;
whitelisted[0x04d7D1531E05368834d60eE8079fF93bcC0773ef] = true;
whitelisted[0xbe62ab381719A38643a4e2a05862CEFB8B1C0adc] = true;
whitelisted[0xbf20064C795362e7A87F6d21fe3C57Bd99e4a9A5] = true;
whitelisted[0xDdDC3d4b581924739ab9C45cb3a4A303C35cC387] = true;
whitelisted[0x8EB0B4A3504b16E3ce7b109964B4DA68a11fe5eC] = true;
whitelisted[0x465DFB1BB744931f361b80642159cd2c202e4653] = true;
whitelisted[0x168732Cf947663b4f672a6F823359808574AA2F8] = true;
whitelisted[0x372700b5a65BF05Ac3059725d5EaC5467c0Ba24C] = true;
whitelisted[0x85521c3e195A8Cf13cB0D25A0a8690Ff103d432d] = true;
whitelisted[0x78d25B09DaDdAa75B0b7522148707F1FB3964C09] = true;
whitelisted[0x395A4f83ceB8704B8305BDF9ad37AdDC22ebA4AC] = true;
whitelisted[0xdc65469B23F41E3b055D048f4e2b4a00340f07a3] = true;
whitelisted[0xe20540fF405A81023C664486C09D7Be0Df3d1f2F] = true;
whitelisted[0xDB4CbA64314645D096bA7f0069d9C0c538c1B024] = true;
whitelisted[0xdA21c8710a5380D7591F62B44bF9070197BD7968] = true;
whitelisted[0x25eB7Ac123cfa5E709CCD4cea8E93B4a7599692c] = true;
whitelisted[0x5c3842551BcF9bdBeeF2C89d5A9b13Cd6Cd9564c] = true;
whitelisted[0x4076CC526d3230279BDe5Aef92eC8377a92C615c] = true;
whitelisted[0xb32c3d503b218e78388Dc59Ca929732A84eEE8C8] = true;
whitelisted[0xf0fC534b6B655a4D3A895e055f57b0F1Aa5d41cd] = true;
whitelisted[0x71abf7d87ce39e589e9D01Db7D0F2f74eBfA59A7] = true;
whitelisted[0x6dFF3e462cd2aC72acABb1C2A053e2Fd6CF05759] = true;
whitelisted[0x20757dAa691900004346f30e0E17596D89872c23] = true;
whitelisted[0x8d430c5f9041091e1dC7C78296f4F15C0B1b5582] = true;
whitelisted[0xe0d9A11C43079a6fd38d4F0F9D27282AbB8c71Cd] = true;
whitelisted[0x72Ea700c4fb968d90dD71Aa56b46aAA69f244c74] = true;
whitelisted[0x30FB24EB7a972f3b565B2D48746e6446db4Eea6f] = true;
whitelisted[0x1F3cC1C2FcF76A1B81746250Fc7D2cad8bcB7ED0] = true;
whitelisted[0xA5d6074d264bC334abD485339B4C98F275AFdEDC] = true;
whitelisted[0x62998bb523Eb9697B08415cC10601f5CA7f88911] = true;
whitelisted[0x4d840bD04Af3Ddd0351Fdcf224eDD7C99DFD2686] = true;
whitelisted[0x4B4f7D8F26F8db6D05A0595281B1C4371d6aa2Fa] = true;
whitelisted[0xAb01FD76F775CaB90E6c66f5a64368d073f14cFE] = true;
whitelisted[0xc9E2eA211A16d5d5d9dE68804f85B13C52D8C548] = true;
whitelisted[0xFB286f9b2eB8EdfDC2039D2aE1648205c0E5380b] = true;
whitelisted[0x3718B3B151981bD7e4422F772454FBB53b8bA193] = true;
whitelisted[0x459D60e2dB519a4F95e35c58Bac84BDF39489607] = true;
whitelisted[0x5815d7969E75222BE61DCd3005890670bfC9b884] = true;
whitelisted[0x95518B05380fB6a2e17aF6e9803E9e2A35f4b8C0] = true;
whitelisted[0xd2b121604B200EC5627683e9aDc705e12bFf8904] = true;
whitelisted[0xe521F16854699984B6f6C9a3357CB19ea711D637] = true;
whitelisted[0xFe49f8b1fee3b800217379960fC1ADedf048352e] = true;
whitelisted[0x464eb33a1949F8E1bf2A67A3b3eD4ddD84E296e2] = true;
whitelisted[0x835CCab1A52328b275E94569C57499A6DfE7d491] = true;
whitelisted[0xc1d903c67420662faff8d08D32ff4b711e723265] = true;
whitelisted[0xE2479c6935cd881C550D69D75d13113833a91B2E] = true;
whitelisted[0x228e7EF9ca9d993cDCdC51157EE3087ec0BFB1Ed] = true;
whitelisted[0xF23d4021baD0c2F50Fc97910eC249bBae0dC3Ff3] = true;
whitelisted[0x22a6C7EAE21e6197d2F180673B8f939e0B2fAe8B] = true;
whitelisted[0x2A02a8410103BD968290ad91E24DF54f4c1C7465] = true;
whitelisted[0xEB3aeEe44F806067BD3981B025C8EB85f994DC8B] = true;
whitelisted[0x21cB5Ee746C51D99CCCccC0D504b1ACC91559A46] = true;
whitelisted[0x8C3e3eD2DA1FFb6BD6fEFCbC938fE22a390eA579] = true;
whitelisted[0x7E79701e4AEf422Fae81f24347CCeC6865340316] = true;
whitelisted[0x4e61712A039eC4A324A6A69A1CE3a06cb368d1E6] = true;
whitelisted[0xF138984Bd659edd8DE38fb2FebEdae8bED5E0255] = true;
whitelisted[0x5d926c21Bb777515B2bAc425e3A55Fc888fd9ea1] = true;
whitelisted[0xe07E7dA4227Ebf6f2bfAB62A3263F54dBD49dB4A] = true;
whitelisted[0x30439021Ed5B3BB247bF0FDbb92F18010930ee7c] = true;
whitelisted[0xBddAe6936532796AfD4346C207d9D87c9B65eA4c] = true;
whitelisted[0x04Eb7Ab4ac0cfb35C4b4aed5da87764d6557485A] = true;
whitelisted[0x2097cB2c883Ece6b966974F2F8a6Ce42Aa209892] = true;
whitelisted[0x423907a13DcE86f5415a4e4221caCBDfb9cDdF47] = true;
whitelisted[0x01Ae4092Dd4c01C744d1ffc80A75F32096c68953] = true;
whitelisted[0xE7217718b7AAe8E1e72776749154D47AD946f266] = true;
whitelisted[0x16eD6434a3bbd876E4C330B96Cec1d152C5b915A] = true;
whitelisted[0xd8D9c080aBDC8E3b4a6dC7dFDB8169B1231996b7] = true;
whitelisted[0x291701880F96117164108e4d1E81214D62D71483] = true;
whitelisted[0x1Bf0197aE08441711D23a25dAD3292541Cbd6374] = true;
whitelisted[0x6569FfFfF55900B45d3E2e5f9a0b885e9d1dF6aa] = true;
whitelisted[0xC9D2F9c0F8A303DFa8141011b9d04dAC08d10D89] = true;
whitelisted[0x71f517666561F091466B579E33D2EF959a17b356] = true;
whitelisted[0xcF83Da6CeA2d7cab27220A87CE95396CfDb0f243] = true;
whitelisted[0xE9c6a3EBD993c80c8300DC800956A4396F4d2501] = true;
whitelisted[0xC49A789b74B35Fb145565C5a53E6F2F1C4102a3D] = true;
whitelisted[0xE1c5a0C52B883372887321f371bfF63EBF077c4f] = true;
whitelisted[0xc1fb4635C1F40B21Ff0Fc5047b7348c847660399] = true;
whitelisted[0x7042679e2252C42f21FFc4D601C45E37C4ac105f] = true;
whitelisted[0xab42c346917F95431799271394c3e061c005886d] = true;
whitelisted[0xD70150A7a5A42d4CD25974DAE077A79a1547fCf2] = true;
whitelisted[0x93B00cAaC54906ee4Ac7c62D4571eDa5BC1eD245] = true;
whitelisted[0xfe35E70599578eFef562E1f1cdc9Ef693B865E9D] = true;
whitelisted[0xcaa670Ea6FF84cC94E84cb775083C67D42EC5BaB] = true;
whitelisted[0xDE00DdeD551183Ae8154564E0685493E5649734F] = true;
whitelisted[0x2451945F2A788c7a83Ca7C57C6e7f0278849BAA3] = true;
whitelisted[0x6De8112bFf63291C59dFe305F775cbB26CcC7cfD] = true;
whitelisted[0xf39082341425894ffF0Ab328cb06A66D9ca7FDa4] = true;
whitelisted[0x091DaAEf38E856CE534d3476edfDdFB07352F844] = true;
whitelisted[0xFa2CAB8fB3409817055E4813b73320610873E936] = true;
whitelisted[0x79f86cb6681D22218C6d8232e0933A3B84f4af6b] = true;
whitelisted[0x3fD0cDA80a210e2eB49720998FE80bfaf0e04361] = true;
whitelisted[0x9283aD43Bd3Eb516E792162C72Eac72761C01a7f] = true;
whitelisted[0xea53f640d19bb353B5a9F5588CaA6552C7412eba] = true;
whitelisted[0xE5050E39ADdF3475f0D7Ebb17C6bde117f0590E2] = true;
whitelisted[0x25159dcA12f885b9bdd3de5525d1C45fF1fCa87d] = true;
whitelisted[0xE1f8dE77C45a128E623C1a4b501254b5AA0Cd0f4] = true;
whitelisted[0xbBBAA9b374136A2FDEF831758Fd6D00f0aA116F5] = true;
whitelisted[0x4fD7F8fa90c6bf4879b59cEd978b745711aADb82] = true;
whitelisted[0x97221D071Cc2a021237e425E22638FF1156339B2] = true;
whitelisted[0x97D2b1b4A249eC77D56fd1576546996d14f7dB1a] = true;
whitelisted[0x774Cd866CEADf1871EfD610Ad30603FFb8034aE5] = true;
whitelisted[0x97814332c57413B6e3eD34a894783ADEB6dC3b93] = true;
whitelisted[0x19c3F6d0239B0d8ADB39d896f6954d9B505404Ac] = true;
whitelisted[0xEfd32898ab149506fe6C8a44aEfEc05626999624] = true;
whitelisted[0xe51ff9eF0cB02a8715729dE3da80E0f438033b14] = true;
whitelisted[0xc45e9d4C43c622Bf215c9270172174FD63921aB7] = true;
whitelisted[0xb328200EcA7C688646af1c8Bb25b6e9B8ed11368] = true;
whitelisted[0x2E3D02c126E75Ad3B4c95DB3A78E83044d39bf31] = true;
whitelisted[0xB0308E00579FCBb470B8F6f5FfcBa92092Bbe0B1] = true;
whitelisted[0x4F4fB31363F28c3cf18F81e7e36163a5cFa81B04] = true;
whitelisted[0x4F4fB31363F28c3cf18F81e7e36163a5cFa81B04] = true;
whitelisted[0xa5FD4055d03350e55b60495eF02396C80d013964] = true;
whitelisted[0x9DfEe19fa2bFc78265D106e7DacA0B6E66555872] = true;
whitelisted[0x6c1Eb20D861C8e24B66C0d13ad5A1BF35A4BfB04] = true;
whitelisted[0xf01f95999EF12E369da3ca48589A7f64620Fd83e] = true;
whitelisted[0xC09486d73b46cEd7f79a698DEbC1ff4A89D55BfF] = true;
whitelisted[0x08dFE42F11b69c51F42588860568f434D4c69A55] = true;
whitelisted[0x9F11Ee7FF81A4dC96A8433cc65800479ED8cCCec] = true;
whitelisted[0x6e4ec434353FE3A7d9D0B5e0Ba4500d9945289Df] = true;
whitelisted[0xB327dF4415aE7Cb806687BA082478B3e3A73AFa5] = true;
whitelisted[0x78b88b3b3fd40AfdCE10023611AA25CB7baE0666] = true;
whitelisted[0x32D54DC24E054Ad3bF382AcdB3a1F22e217eB6DA] = true;
whitelisted[0x94a79E1fccf46e67FD0Ee9f129Be486fD22EB829] = true;
whitelisted[0xCDc8A902588354d8e8804ECb7561023b7b3f075c] = true;
whitelisted[0xfAe7466C2C85A43D90b9bA7f49baFD314ba6660D] = true;
whitelisted[0x4770a080a1093c169019C14abD6c51Bc7F832AB0] = true;
whitelisted[0x68B29be40c82e0100fE9860b365FdE031c18f2dF] = true;
whitelisted[0x2E9945556BD8011745c4BCfE09C28b5656f9Aa0B] = true;
whitelisted[0xB1b16Ba1ECd5b8Ef50DB932122b86f1b7c9A982c] = true;
whitelisted[0x606530873dEd3b6284c269aC0eFC297795376f96] = true;
whitelisted[0x798AE58fe6f1B550476A032E7FA004892Fcd0631] = true;
whitelisted[0x0eBf8AAcBD98EeebF0eabbe1387627121913cd12] = true;
whitelisted[0x7113bE8de505329C1819e3e8B654D5C54aC51799] = true;
whitelisted[0xA26c5F0b89322cd75828d5085Db8164287315df3] = true;
whitelisted[0x957Ae0C4Ef6BE6752C75D1Fdd29e3e4375A3feE8] = true;
whitelisted[0x02659749Ef7984256C4F2c6fd68a0DBd24E3b40d] = true;
whitelisted[0x7fc894F8daD005e72b0C6409C9163C8C969e62d2] = true;
whitelisted[0xf055E89033b00Be0Eb46f8302fb106449CFe5AD2] = true;
whitelisted[0xb484c7c35d833EEb6F0Fc8772220bd82457a01D6] = true;
whitelisted[0xe52BbCCDc7e6b9A8F1372643fB27afdF0b27EC86] = true;
whitelisted[0x31546c09Ce57628F98D5A4B78b164207595BaF6C] = true;
whitelisted[0xEF329f60d04036A8Bf1f8AAA2398a554AdE9D307] = true;
whitelisted[0x7AE1C51348f3DE435A18d79D545C56C9D34e68b7] = true;
whitelisted[0xf34429badf0e55B8362f3A6fE697DA9E72539D1F] = true;
whitelisted[0x44eeA440B81E8FE02cA5B9c5C49E38B1bF45C658] = true;
whitelisted[0x22B7eB878426eC9D7a24531489FeB2F669171271] = true;
whitelisted[0xB54ddeA1C9B2C0Faa0b946eDc3699F2c287Eeb31] = true;
whitelisted[0xDe831beEC5103340f560ED998E7032Bf4AbDc3dD] = true;
whitelisted[0xC4e4F6B40c47bFFF49A47Bad755e212635bd838a] = true;
whitelisted[0x2725d6fB88d37855acc5434F3BB449cdB005c2A5] = true;
whitelisted[0xA82B5796E694340AAbcd2267B44324A6a598e01F] = true;
whitelisted[0x0613BD6d359f576917c6cC732F835536Ec18F521] = true;
whitelisted[0x826E45dc4782d427AbD0afCCfe093495Ba49ddE0] = true;
whitelisted[0xC23cB6D192C864E1c50Fb90d8e7955507F450C02] = true;
whitelisted[0x2404907077b872081b349f21f4319aBD95EeA3D9] = true;
whitelisted[0x956124621bbc5f8eBa2A4c1282A3f15e74814Fb0] = true;
whitelisted[0xB02d7591f34026cEFc8CCd65c9358147a6820501] = true;
whitelisted[0xF6BB3aeb1a99A8049e3175cdBcD12f127dD2BA08] = true;
whitelisted[0x8580DE1fd8C5423b2Ec64860a791211c3ADf6205] = true;
whitelisted[0x5A776Ea5e89d6F4504b208A6BD459D912A2ee22e] = true;
whitelisted[0xfF5D98C2A2EB2f27DA61566c22c4C64639E1AB0B] = true;
whitelisted[0x8dB6a14b795E9C69aA8eC8898f15179E981666f6] = true;
whitelisted[0x0349b10a1A14384472e0b77c00355F4C434218c1] = true;
whitelisted[0x6975C0cF6A84a3E2C1aC2637eDf0343f87d2D70F] = true;
whitelisted[0x93c23a326Ab520Dd7Fc3125FdfB1553970346042] = true;
whitelisted[0x09c66e394811356a268f35E668Fcc866D943476d] = true;
whitelisted[0xF7D941c4584Fc8810df56dD1E74F023908755219] = true;
whitelisted[0x17e3E51A3F3679BFf3DbeA7f8f9d69e5A17e3937] = true;
whitelisted[0x9bb73422d9E3dd9a7fc89d93BEF1e2F4a6F29F3D] = true;
whitelisted[0xeCDE97F066dCd1aAa86Fe8601B7F91eD0aB97481] = true;
whitelisted[0xfA1256E48f337Db21067b59D07c9E3896D75F820] = true;
whitelisted[0x75e2638b5897feB84b2BC7D0F64b3f723b7d7c71] = true;
whitelisted[0x2DD4D7c3872C080e268bCE24A7C9fa761Ce90122] = true;
whitelisted[0x63e85b83240Ca2D696E52BDa2784723AB92D353E] = true;
whitelisted[0x37F8e422106F9672238539D1Aa3853f928A517B7] = true;
whitelisted[0xb5619Ba9D7f67254e4C53c8bE903d951B551C9a5] = true;
whitelisted[0x6f01bA27821B4d4A41608a99B400944b757d0F9d] = true;
whitelisted[0xA41DCEe235F7F8Ab2C7d8a3e36fdC63704c142ae] = true;
whitelisted[0xEAcB8C928aA66d304e3ec7A0adC7456EEE844289] = true;
whitelisted[0x8B785F9c08dC9C34a532B4Fd9f37801A2b8159a8] = true;
whitelisted[0x5d5C4508e1b1953a19276B0206ad7b7CDe0C95Ca] = true;
whitelisted[0xd74E20f81f0EdEf3d916c9C518521cd1EC41566D] = true;
whitelisted[0xDDb0f82BA75759cB86Aa8b04d7D435458332944b] = true;
whitelisted[0xf36B79aF25aC3E772E547AcD0196859A89Ce1AA4] = true;
whitelisted[0xb5e56848e46cf9648Bd2415f48209b6085d5D80C] = true;
whitelisted[0xE5628BFB3b0a194A03aF441bF29C6E6969Fb0848] = true;
whitelisted[0x8425957Ab74eF280dEB3Efeee4862EF2aF00B326] = true;
whitelisted[0x0eaE88ba75E93C162d53b253e9500e8Ad2B59E21] = true;
whitelisted[0xf446667761b436a3f666a7250DBd7dE25bDa2286] = true;
whitelisted[0x174fdDdeaD0827ad5184bA8487326A719DE9D5de] = true;
whitelisted[0xCBAb567d0331191450a390E5A97cb5838C356c66] = true;
whitelisted[0x714e075198636956785B4cC08Be1C70d9361C445] = true;
whitelisted[0xF9EA1E1b8110401E1c76AEb52ebf273A611De7B3] = true;
whitelisted[0x9f495444Ff4aed32BD1F5344cBE3e0D2cdcCDB04] = true;
whitelisted[0x0491B8dEc824091905ef7aB15137aC6E4eF870f3] = true;
whitelisted[0x8B3979Edd867bfc4Ca2f67ef0056Cc456E615A78] = true;
whitelisted[0x0376De0C2c8A2c8916Dab716d47D9652087C2918] = true;
whitelisted[0x58EE83dcc06230A34a9117E12FEd81e5e575D79e] = true;
whitelisted[0x04A2a0d00529260913b46ebc87545b1a9DC7c322] = true;
whitelisted[0x8881D9431f5c4262ecaE3DB8D03a74031a6Ea1A8] = true;
whitelisted[0xd79B83608FDA9cB24dFA73f346EaBb60D22c0943] = true;
whitelisted[0xE9514829A666C19A8Dc86cD3f060D45A966564C1] = true;
whitelisted[0xC56c5F4e16861cf0505e42f84b6a0EB8011383c9] = true;
whitelisted[0x9115960F43e5400Ebb199571aC30DA6CFbD67C34] = true;
whitelisted[0x3d94B91cce80364eeBdf3416ad612Ff9CbA6cff5] = true;
whitelisted[0xD4BBe225b6A92cdadC69301Dd54C1Cf0E437B659] = true;
whitelisted[0x6b80Db1729089783B3e6fe475Ce743A2F6Fe8dAE] = true;
whitelisted[0x0e4230c3cbAFbACa98E1419721deC3D108767B72] = true;
whitelisted[0xb390353fa8Eb0A8b82A790576Ac1507400e06563] = true;
whitelisted[0x4A9A80B052F3F8Ed3DDd105C840a260fa54DcA36] = true;
whitelisted[0xc445B4268D41293F986De7d276186e2d3AFBA543] = true;
whitelisted[0xE3E7BeD661E60c1cAf7698ca5481D882543228E5] = true;
whitelisted[0x915e070BD89Efd5802aE7f5eE03294146D44F0FA] = true;
whitelisted[0x18817D1F7CDd0De0Bdb4e23c76CB7Dc85569e4f9] = true;
whitelisted[0xBf811B29DF3333AEc5eD1D3ACA28206331d29306] = true;
whitelisted[0xD71591a5E3D42a47168e43Ce6ED113029AE480e8] = true;			
whitelisted[0x64284050750c3127330f946c7C18607dDd458c3f] = true;			
whitelisted[0xdfe813b81194A8f093ABbA7BaaB8A223f75d6022] = true;			
whitelisted[0x82A1955F1e1E2ed397d9Ca25D40b36259A1130B4] = true;			
whitelisted[0x55200e4994E515f9d5cD0Cd6fcd652ae839795Dd] = true;			
whitelisted[0x08137923F88286F6A0827c6e0FDea457438bb948] = true;			
whitelisted[0xd68F9D1231cd1a4373BF9A5Ea90790381f2D4b38] = true;			
whitelisted[0x9E71155036613c44A5AF1Eb5eeE33527f7c9c57F] = true;			
whitelisted[0xD5cdFD9Af073a09831F69aA426a1daD158a82A36] = true;			
whitelisted[0x72701944DA5bc2C1C9589fdAab99Ae29E71658E8] = true;			
whitelisted[0x972fB92aF6462FfF526f719FDA4281145F2bcd15] = true;			
whitelisted[0x35808979eB8DEE16b246C83Bb02a3F74D36ca5A8] = true;			
whitelisted[0x7A06C18F061f7c9DE589DA6D3D453F4F1ED235e3] = true;			
whitelisted[0x7cc6970D33d5fd67f4365025cbAC3022fA0f6dCA] = true;			
whitelisted[0x1089162bcFf05473D2156064b36A5fb57cC77F1f] = true;			
whitelisted[0x3aD0f57F006b5A060d4631dF7A996D7a188D9452] = true;			
whitelisted[0xD2d80367baC6E312eD4495E8786EE23c6652E276] = true;			
whitelisted[0x8927Fc1CF07c76f26437a3f13B69E25AA25b986e] = true;			
whitelisted[0xA7A884C7EbEC1c22A464d4197136c1FD1aF044aF] = true;			
whitelisted[0x2654A8b74dcAcBfeA10e145E259263835C3E6fbb] = true;			
whitelisted[0xf97893b7807113D6151435346b0226eF15A61779] = true;
whitelisted[0x1AfD0eCA2adeF82634b6CF424dfb26b33E2EC756] = true;
whitelisted[0x423f64d01aa9844B324265cE85cEd77BFCd3dd3B] = true;
whitelisted[0x569F3F589aE90F0DfB6133d8a11181E4A3640D1e] = true;
whitelisted[0x203baF5A2724F97aE66fcaa201B31E89bAA5Ca76] = true;
whitelisted[0xd11071FD3dfd4FbDF3EE8Fbe88D97894cf777375] = true;
whitelisted[0x52d32D91E18fF67206f63D73503b9184d2f23e8D] = true;			
whitelisted[0xA15C4bEfA88D9B6E6bFb75cE11ebFDf4c4f7663E] = true;			
whitelisted[0x1b4aeB74167A64D1d7CbE8cC02ed5043C01e1F45] = true;			
whitelisted[0x43C3cE13e7325f67672faCebA4307921dEBf4b24] = true;			
whitelisted[0x413C04EDfFAFeB2730a8BdDdA243a7851F1f96ED] = true;			
whitelisted[0xa777Cf5DD2a1651fd0eE8cF02a219D059b3FC2a7] = true;			
whitelisted[0x73a3d06aB041B19b487003E57ad562C2a39E53b7] = true;			
whitelisted[0x945d2b50e64a7666289a428019b18e1390791d9e] = true;			
whitelisted[0x252268c4913DC3A1A72c6Fb3D43c178734e9c6aC] = true;			
whitelisted[0xF123E2025E7790126045be0fce7107bF707275cf] = true;			
whitelisted[0x2474DF60ae28F3CbA77c44D0C316BFd37DC02cF4] = true;			
whitelisted[0x1Eb37FC58D33FE9B1aAd30Bf7562980874DDC987] = true;			
whitelisted[0x5D50A1AB1488479f0556c94daf52E43aaA0EB892] = true;			
whitelisted[0x0BdA5FfA68972Ae3586102deF7f97083B6aB54A3] = true;			
whitelisted[0x7FEE2348c301E6170986579d7F2aE2F433380cC4] = true;			
whitelisted[0x26230A0791B0f68ab627515353BF2222112D68Bd] = true;			
whitelisted[0x98319863e839Af6654CaAce9f296608eD1F1AD5D] = true;			
whitelisted[0x8b82Aab492F9bf28456c91e4BD28633fb4c5B0BC] = true;
whitelisted[0x81A1C87e8BcA4833944Eb93433828bC815F90A08] = true;
whitelisted[0x394b0CA58672253287a2b4BB2EE8ae73D3bad4c2] = true;
whitelisted[0x1cBf0B8A6F916E922168cbB55AEb3346d9D0227d] = true;
whitelisted[0x0C1138cf05e3c17f5643DceFFC3f86d99C98e5a5] = true;
whitelisted[0x5D50A1AB1488479f0556c94daf52E43aaA0EB892] = true;
whitelisted[0x8Ac0012A3A3F02b5c89e8bf4a9b7cEBca0732D02] = true;
whitelisted[0xcF9cd29590221d227CdAaB52e376A45624698329] = true;
whitelisted[0xD887Ee55b7a0ACf6E15E5A4F520E7F4cade3Ae2e] = true;
whitelisted[0x84E8dD15880De1e5eA13288dDFd9C3Fd2E72f21e] = true;
whitelisted[0x0953678ac2Ee8571486ca9f94D3306d403Cc76C0] = true;
whitelisted[0xE91614FeB9386Ad1FA4E311c1eab5473353B591C] = true;
whitelisted[0x3B125D1a818a04F0f849eC0a31aa3bD4100eB390] = true;
whitelisted[0xF982b15aEf739B43838234fc5eFEc85b0AdE0f36] = true;

whitelisted[0xBf4a71dbf09e8a6eBfeE408EfF189EB1DD20DE4a] = true;			
whitelisted[0x7f9eF59C6a5cc3C6cA4809442ABD12436319f118] = true;			
whitelisted[0xbF8Bd659Cc3062904098a038FF914Db67b7550D6] = true;			
whitelisted[0x3ce1487a24Bd417EEeA24Bf8eBEE0a6ea2A897af] = true;			
whitelisted[0xc019845298DfC7BBAF7e841DCeA92E36CeD840d3] = true;			
whitelisted[0xBead303D300116b4593d95FCCb9132117f3521B6] = true;			
whitelisted[0xe01Dd1aD7CcF754e388C427DebFA5fBe0363C10E] = true;			
whitelisted[0xd13cAA052Bc5612bAF506801828630cc80C5B63E] = true;			
whitelisted[0xf109Bf184560D347951B05daF44b7631334c83b2] = true;			
whitelisted[0xb251e24A2f657Dcdc1Ade27990269f34dCB57613] = true;			
whitelisted[0x43Ec5640E18F7384761d8817AA55d38C9a03D855] = true;			
whitelisted[0xde003a61b4724E6d230b2aa7A8F15Fe3fa515c77] = true;			
whitelisted[0xb4cAE30D15dbD9E50c3F6508bA064efa988BecE6] = true;			
whitelisted[0x9629c280e36af04c208CE6336B56F986C4369959] = true;			
whitelisted[0xC080066df02f6B1cDb1737F2e529f6f7EC4ff674] = true;			
whitelisted[0x341D13B93a9e6eC3B9b2B5C3EE7747D6eC95Cf69] = true;			
whitelisted[0x30FfD527A107619a5e3D39F2EDb55426964590a4] = true;			
whitelisted[0x1DA7fF9d8eAd6B038A2d6a5514a961abFd22d714] = true;			
whitelisted[0xEe683f46B4054e0B82D973990601deC81E779532] = true;			
whitelisted[0x6A9C8818Fa59d20b29025a88680948ceBA24bb8c] = true;			
whitelisted[0x7e7Cf183d5b2f478b3A5F61aE7fFc9c2DB9Dfb60] = true;			
whitelisted[0x5A9690623140646Fd8fa124707b997524e4E2F5D] = true;			
whitelisted[0x30b4cE3FcDBB7C719394163520d5779863D614cF] = true;			
whitelisted[0x5EC90Cca6069bc4C5ABf5D5AeD68111B2cDA47fA] = true;			
whitelisted[0x0CA63D94f2C6eeC571FAb25a4E7A6C9FDA6d6654] = true;			
whitelisted[0xFaDF08352ee5Ec6e685cb64e19a5d89b2512D2a7] = true;			
whitelisted[0xc082bdB52B9F341d8ab5D8aE9dA708d13c230cca] = true;			
whitelisted[0x4fB5Ae963c4fDa03D98Fc3ff8ff287FDF49dE548] = true;			
whitelisted[0xff4D4218A1bb165836CB129BC59839404012e4cE] = true;			
whitelisted[0x1c4dAbFe900BcCd23Ad60aDDeAB94F13394F68de] = true;			
whitelisted[0xf037F1804466dB5dC4D2f701d8270c4cb3e579Dd] = true;			
whitelisted[0x31C4A92e3f21Ee878e386853E555ad758ef9aa17] = true;			
whitelisted[0xca05dA65c7F83a30556fFFFB035E58BADa4d9cCf] = true;			
whitelisted[0xA6c9B5696Cf6edbeF25d941714ce1BFCA544f3c4] = true;			
whitelisted[0x7833Bb98Bf9b155f9824e36B2ec5d7E708A88f9f] = true;			
whitelisted[0xb915d1e50b237A1C3A12a1487F3510cddb466Dd6] = true;			
whitelisted[0x0Ada4Adf3597967F784dAFb51DFbcc9e64956505] = true;			
whitelisted[0xe51544985c9a2b0954851Cb6E4eBE4AaC30fc957] = true;			
whitelisted[0x60b01ae135C98391FD15fE9B0E1CF9F41C4A306a] = true;			
whitelisted[0x9849BCD390685449692326d918Df9A4d1b5a8401] = true;			
whitelisted[0xDC673E9983F2351dEb4f5B4018A6b8bEc68234F2] = true;			
whitelisted[0x901c20dfe0e6bef2d51d2B15111bbE1335171aD1] = true;			
whitelisted[0xF9b5306f5514f8EdB880A86245eBf4b49eba9567] = true;			
whitelisted[0xfd74Bdb20554E76485A81955E238AC6Eb00dF047] = true;			
whitelisted[0x9e702dd2e1Ecc7593838576b100882002D7f6cA3] = true;			
whitelisted[0xdF592Ccb1FE148344C26e8227596aA17eC914b5D] = true;			
whitelisted[0xeD41b56c2CfAD62dCA70C8084e6107eBa43A1679] = true;			
whitelisted[0x9ba5db85A44c9Be5b120d7f903e503Cb3e578eeB] = true;			
whitelisted[0xA96Cb579717Ca0f8778bCA959567649423F652d4] = true;			
whitelisted[0x0EFBC741C525Eb3c7fE9Cd69C91759B1d3dAf842] = true;			
whitelisted[0x1e81AF8e1E089bD9E42A7257ce1be601C105074d] = true;			
whitelisted[0x8F0Ff05B4FD3a41B46513A1D0aa9Dd98EBDB1d3F] = true;			
whitelisted[0xe8f7D2b4959a0b0DAE31bF3f40Ee2116141Ec193] = true;			
whitelisted[0x2c50a641ae7fa8d4679aF1DC1b0f2BF8A5af895e] = true;			
whitelisted[0x3bBC207665749fe728D19F1148D693c273ec4bBd] = true;			
whitelisted[0xA4dd32514aE5B7944060d0F614e1317895778770] = true;			
whitelisted[0x3249c789e879cf23171E364eC90eCe51DDAca890] = true;			
whitelisted[0xF4dB84889cd07C4578c7d48A8D18ae81Abaa7D55] = true;			
whitelisted[0x63225f11c81727Dd9Baa4a4F7F2dbE7078d42896] = true;			
whitelisted[0xab754019ed96Ab92fB469cA624F1A04b4Fe5967d] = true;			
whitelisted[0x1321BC6FFa79aB03ed1F773504340428f660025c] = true;			
whitelisted[0xA00E5D2d0e18f2c4Bf9fe8F35Fe39FdB2FD589eD] = true;			
whitelisted[0x109440CBe5b508A7063ca126c88b0F81D3829575] = true;			
whitelisted[0x292c1B45C186f02F3d70f0f9f56dF9145b272a27] = true;			
whitelisted[0x5086cb64BE7927Ab4C4d9388Aa8C7246480dc8E1] = true;			
whitelisted[0x69DC7BD9D94f5B836A9Cbadc503b4142CE457e36] = true;			
whitelisted[0xCD0e0c8009D0933668dD36A32Ecc2EFE69eA9F8c] = true;			
whitelisted[0xCd64cB7c47bA9A43fE97E168a84F517C6ef5f07c] = true;			
whitelisted[0x0A7c1e9e61aC76f816EA4918852B1c729E7Dc952] = true;			
whitelisted[0x06E3B9b3517968bE0C79200652CeCC67e8f786fA] = true;			
whitelisted[0x76E5B98221904F0cD7822f877aE9a69eC68E2DF8] = true;			
whitelisted[0x1EB380F121b3B337a4e033E91f0Ec5a2c35fAAFD] = true;			
whitelisted[0x0E9c6654239025789F5253876EDBF6564732476c] = true;			
whitelisted[0xb547dC3Be99387B6821D2E2e3b47e4Cd4e6B937E] = true;			
whitelisted[0xA096f89714e5Ccef1fd1118940204E57535aC896] = true;			
whitelisted[0x097C8FA2846429eb2E60a7b4de6A360C3bfE744f] = true;			
whitelisted[0xd802e753576AC46790494A64F4525De79A7Ea8FF] = true;			
whitelisted[0xD644Ab7Dea40d3D1FC7fcE514f222f386e1ff78F] = true;			
whitelisted[0x6f3fd56808bC1e1CC9778b0A65DeB44205C68e93] = true;			
whitelisted[0xe827a3f75a90805F732e9de3BA3C036aFc1861a0] = true;			
whitelisted[0x74148C62BFF70Cf840a872b85D055D17DEE41ACD] = true;			
whitelisted[0x97FB43a567487C3312911e57b72a2917a5F077A6] = true;			
whitelisted[0x2EBdaFfC8Db131cbd766628614861a3153AA4B8F] = true;			
whitelisted[0x5A6eC1824Bfb3fE9d542AE7BAee620105aA32CfC] = true;			
whitelisted[0x23F0b4f95786648D8b8A24394ECc8CbAC51E6A6B] = true;			
whitelisted[0xDa7873546F20025A53E9f6610bb41cb4e6Ce7B43] = true;			
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
