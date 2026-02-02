
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Randomness {

    struct Request {
        uint256 seed;
        uint256 blockNumber;
        address requester;
    }

    uint256 public requestCount;
    mapping(uint256 => Request) public requests;

    event RandomRequested(uint256 requestId, address requester, uint256 seed);
    event RandomGenerated(uint256 requestId, uint256 random);

    function requestRandom(uint256 _seed) public returns (uint256) {
        requestCount++;

        requests[requestCount] = Request({
            seed: _seed,
            blockNumber: block.number,
            requester: msg.sender
        });

        emit RandomRequested(requestCount, msg.sender, _seed);
        return requestCount;
    }

    function generateRandom(uint256 requestId) public returns (uint256) {
        Request memory req = requests[requestId];
        require(req.blockNumber < block.number, "Wait for next block");

        uint256 random = uint256(
            keccak256(
                abi.encodePacked(
                    req.seed,
                    blockhash(req.blockNumber),
                    blockhash(req.blockNumber + 1),
                    block.timestamp,
                    req.requester
                )
            )
        );

        emit RandomGenerated(requestId, random);
        return random;
    }
}
