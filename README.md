# On-Chain-Randomness-via-Blockhash

📌 About the Project
This project focuses on generating pseudo-random numbers on the blockchain using Solidity. Since blockchain environments are deterministic, traditional random number generation is not possible. The purpose of this project was to understand this limitation and implement a practical on-chain solution using blockhash values and user-provided seeds.

I worked on this project step by step to understand how randomness can be simulated in a decentralized environment while keeping the process transparent and verifiable.


🎯 What I Tried to Achieve

Learn why randomness is difficult on blockchain
Design a smart contract that generates pseudo-random numbers
Use blockchain data like blockhash to improve unpredictability
Store and manage multiple randomness requests
Test and validate results through real contract interactions

🛠 Technologies Used

Solidity – Smart contract development
Remix IDE – Writing, deploying, and testing the contract
Remix VM (London) – Local blockchain simulation.



🧠 How I Worked on This Project

Step 1: Understanding the Problem
I started by learning why smart contracts cannot use normal random functions. Since all blockchain operations must be deterministic, I explored how block-related data such as blockhash can be used to introduce unpredictability.


Step 2: Designing the Contract Logic
I designed the contract in a two-step process:
First, the user requests randomness by providing a seed.
Second, the random number is generated after new blocks are mined.
This separation helps reduce predictability and miner influence.


Step 3: Requesting Randomness
I created a function where the user submits a seed value.
The contract stores:
The seed
The current block number
The requester’s address
Each request is assigned a unique request ID.
An event is emitted so the request can be tracked.


Step 4: Generating the Random Number
After waiting for future blocks, I implemented a function to generate randomness.
The function combines:
Stored seed
Recent blockhash values
Current timestamp
User address
All values are hashed using keccak256 to produce a pseudo-random number.
The result is emitted as an event.


Step 5: Testing and Verification
I deployed the contract using Remix VM.
I tested multiple randomness requests with different seeds.
I reused the same seed multiple times and observed different outputs due to changing block data.
I verified stored request details using read-only function calls.

📤 Project Output

The project successfully produces:
Pseudo-random numbers generated on-chain
Stored request data (seed, block number, requester)
Event logs for transparency and tracking

⚠️ Limitations

The randomness generated is pseudo-random, not truly random
Miner manipulation is reduced but not completely removed
Not suitable for high-value financial or DeFi applications

🚀 Future Improvements

Integrate oracle-based randomness (e.g., Chainlink VRF)
Implement commit–reveal mechanisms
Combine off-chain and on-chain randomness

📚 What I Learned

Through this project, I gained hands-on experience in:
Solidity smart contract development
Blockchain randomness concepts
State management using mappings
Event handling and debugging
Practical deployment and testing using Remix

🧾 Conclusion

This project helped me understand the real challenges of randomness in blockchain systems and how on-chain data can be used to design practical solutions. While the approach does not generate true randomness, it is effective for learning purposes and low-risk decentralized applications.





