// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VerifiedAuction {
    address public auctioneer;  // The person who starts the auction
    uint public auctionEndTime; // When the auction will end

    address public highestBidder; // Address of the highest bidder
    uint public highestBid;       // Highest bid amount

    mapping(address => uint) pendingReturns; // Refunds for outbid bidders

    bool ended; // Auction end flag

    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    // A list of verified bidders (only verified addresses can place bids)
    mapping(address => bool) public verifiedBidders;

    constructor(uint _biddingTime, address[] memory _verifiedBidders) {
        auctioneer = msg.sender;
        auctionEndTime = block.timestamp + _biddingTime;

        // Initialize verified bidders
        for (uint i = 0; i < _verifiedBidders.length; i++) {
            verifiedBidders[_verifiedBidders[i]] = true;
        }
    }

    // Modifier to check if the caller is verified
    modifier onlyVerified() {
        require(verifiedBidders[msg.sender], "You are not a verified bidder.");
        _;
    }

    // Bid on the auction (only verified bidders can bid)
    function bid() public payable onlyVerified {
        require(block.timestamp < auctionEndTime, "Auction already ended.");
        require(msg.value > 0, "Bid amount must be greater than zero."); // Prevent zero bids
        require(msg.value > highestBid, "There already is a higher bid.");

        if (highestBid != 0) {
            // Refund the previous highest bidder
            pendingReturns[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
        emit HighestBidIncreased(msg.sender, msg.value);
    }

    // Withdraw the previous bid if outbid
    function withdraw() public returns (bool) {
        uint amount = pendingReturns[msg.sender];
        if (amount > 0) {
            pendingReturns[msg.sender] = 0;

            if (!payable(msg.sender).send(amount)) {
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }

    // End the auction and send the highest bid to the auctioneer
    function endAuction() public {
        require(msg.sender == auctioneer, "Only auctioneer can end the auction.");
        require(block.timestamp >= auctionEndTime, "Auction not yet ended.");
        require(!ended, "Auction already ended.");

        ended = true;
        emit AuctionEnded(highestBidder, highestBid);

        // Send the highest bid to the auctioneer
        payable(auctioneer).transfer(highestBid);
    }

    // Verify additional bidders (auctioneer can add more verified bidders)
    function verifyBidder(address bidder) public {
        require(msg.sender == auctioneer, "Only auctioneer can verify bidders.");
        verifiedBidders[bidder] = true;
    }
}
