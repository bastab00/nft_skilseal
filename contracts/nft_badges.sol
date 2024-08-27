// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CourseCompletionBadge {
    
    uint256 private _nextTokenId;  //_nextTokenId Keeps track of the next badge ID to be minted.

    mapping(uint256 => string) private _courseNames; // _courseNames Maps badge IDs to course names.

    mapping(uint256 => address) private _owners; // _owners Maps badge IDs to their owners.

    event BadgeMinted(address indexed recipient, uint256 tokenId, string courseName); //  event BadgeMinted Emitted when a new badge is minted, containing the recipient's address, badge ID, and course name.

    // Mint a new badge for a specific course
    function mintBadge(address recipient, string calldata courseName) external {
        uint256 tokenId = _nextTokenId++;
        _owners[tokenId] = recipient;
        _courseNames[tokenId] = courseName;
        emit BadgeMinted(recipient, tokenId, courseName);
    }

    // Get the course name associated with a badge
    function getCourseName(uint256 tokenId) external view returns (string memory) {
        require(_owners[tokenId] != address(0), "Badge does not exist");
        return _courseNames[tokenId];
    }

    // Get the owner of a badge
    function ownerOf(uint256 tokenId) external view returns (address) {
        require(_owners[tokenId] != address(0), "Badge does not exist");
        return _owners[tokenId];
    }
}
