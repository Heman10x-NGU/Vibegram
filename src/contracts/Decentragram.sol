pragma solidity ^0.5.16;

contract Decentragram {
    // Code goes here...
    string public name = "Decentragram";

    ///store posts
    uint256 public imageCount = 0;
    mapping(uint256 => Image) public images;

    struct Image {
        uint256 id;
        string hash;
        string description;
        uint256 tipAmount;
        address payable author;
    }

    event ImageCreated(
        uint256 id,
        string hash,
        string description,
        uint256 tipAmount,
        address payable author
    );

    event ImageTipped(
        uint256 id,
        string hash,
        string description,
        uint256 tipAmount,
        address payable author
    );

    //create posts

    function uploadImage(string memory _imgHash, string memory _description)
        public
    {
        //make sure image hash exists
        require(bytes(_imgHash).length > 0);
        //make sure Image description exists
        require(bytes(_description).length > 0);
        //make sure uploader exists
        require(msg.sender != address(0x0));

        //increment iamge id
        imageCount++;

        //add images to contract
        images[imageCount] = Image(
            imageCount,
            _imgHash,
            _description,
            0,
            msg.sender
        );

        emit ImageCreated(imageCount, _imgHash, _description, 0, msg.sender);
    }

    //tip posts
    function tipImageOwner(uint256 _id) public payable {
        // making sure the Id  is valid

        require(_id > 0 && _id <= imageCount);
        //fetch the image
        Image memory _image = images[_id];
        //fetch the author
        address payable _author = _image.author;
        //pay the author by sendin them ether
        address(_author).transfer(msg.value);

        //increment the tip amount
        _image.tipAmount = _image.tipAmount + msg.value;

        //update the image
        images[_id] = _image;

        emit ImageTipped(
            _id,
            _image.hash,
            _image.description,
            _image.tipAmount,
            _author
        );
    }
}
