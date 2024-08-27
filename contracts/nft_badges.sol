// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CourseCompletionBadge {
    
    address private _owner; // Stores the contract owner's address
    uint256 private _nextTokenId; // Keeps track of the next badge ID to be minted

    struct Badge {
        string courseName;
        address owner;
        uint256 issuedAt;
        string description;
    }

    mapping(uint256 => Badge) private _badges; // Maps badge IDs to badge details

    event BadgeMinted(address indexed recipient, uint256 tokenId, string courseName);
    event BadgeRevoked(uint256 tokenId);

    // Modifier to restrict access to only the contract owner
    modifier onlyOwner() {
        require(msg.sender == _owner, "Not the contract owner");
        _;
    }

    // Constructor sets the deployer as the contract owner
    constructor() {
        _owner = msg.sender;
    }

    // Function to transfer ownership to a new address
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        _owner = newOwner;
    }

    // Mint a new badge for a specific course with a description
    function mintBadge(address recipient, string calldata courseName, string calldata description) external onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _badges[tokenId] = Badge(courseName, recipient, block.timestamp, description);
        emit BadgeMinted(recipient, tokenId, courseName);
    }

    // Batch minting for multiple recipients
    function mintBadges(address[] calldata recipients, string calldata courseName, string calldata description) external onlyOwner {
        for (uint256 i = 0; i < recipients.length; i++) {
            uint256 tokenId = _nextTokenId++;
            _badges[tokenId] = Badge(courseName, recipients[i], block.timestamp, description);
            emit BadgeMinted(recipients[i], tokenId, courseName);
        }
    }

    // Get the details of a specific badge
    function getBadgeDetails(uint256 tokenId) external view returns (string memory courseName, address owner, uint256 issuedAt, string memory description) {
        require(_badges[tokenId].owner != address(0), "Badge does not exist");
        Badge memory badge = _badges[tokenId];
        return (badge.courseName, badge.owner, badge.issuedAt, badge.description);
    }

    // Revoke a badge by deleting its data
    function revokeBadge(uint256 tokenId) external onlyOwner {
        require(_badges[tokenId].owner != address(0), "Badge does not exist");
        delete _badges[tokenId];
        emit BadgeRevoked(tokenId);
    }
}
