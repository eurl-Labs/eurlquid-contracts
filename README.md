# 🌊 Eurlquid Mock Contracts

This repository contains **mock smart contracts** deployed on **Sonic Mainnet** for demonstration and preview purposes of the **Eurlquid Dapp**.  
These contracts simulate popular DEX and ERC20 tokens so developers and users can interact with the Dapp without using production-level protocols.  

⚠️ **Disclaimer**: These contracts are **mock implementations only**. They are not audited and **must not be used in production**. Their sole purpose is for **testing and UI/UX preview** of the Eurlquid Dapp.  

---

## 🔗 Network Information

- **Network**: Sonic Mainnet  
- **Chain ID**: `146`  
- **Public RPC**: `https://rpc.soniclabs.com`  
- **Explorer**: [https://sonicscan.org](https://sonicscan.org)  

---

## 📑 Contracts

### 🔹 ERC20 Mock Tokens
These tokens are simplified ERC20 contracts (mintable) used for testing liquidity pools and swaps.  

| Token     | Symbol  | Address                                                                 | Explorer Link |
|-----------|---------|-------------------------------------------------------------------------|---------------|
| Wrapped Bitcoin (Mock) | wBTC   | `0x395eAc2CE4fFFcd578652D689A0eeCC608649200` | [View](https://sonicscan.org/address/0x395eAc2CE4fFFcd578652D689A0eeCC608649200) |
| Wrapped Sonic (Mock)   | wSONIC | `0xEc3a35b973e9cb9e735123a6e4Ba1b3D237A9F7F` | [View](https://sonicscan.org/address/0xEc3a35b973e9cb9e735123a6e4Ba1b3D237A9F7F) |
| Test USDT              | tUSDT  | `0xb13aF633516fe0d21BeB466C95fc34C3917BaAFb` | [View](https://sonicscan.org/address/0xb13aF633516fe0d21BeB466C95fc34C3917BaAFb) |
| Test USDC              | tUSDC  | `0x534dE6164d9314b44c8682Be8E41306A8a8cE2Ae` | [View](https://sonicscan.org/address/0x534dE6164d9314b44c8682Be8E41306A8a8cE2Ae) |
| Test PENGU             | tPENGU | `0x2b026284561AF82CC015e61d2ecB5b7653f36190` | [View](https://sonicscan.org/address/0x2b026284561AF82CC015e61d2ecB5b7653f36190) |
| Test PEPE              | tPEPE  | `0xeC4671DdD18f88eF7076124895cf42E067f3D4C5` | [View](https://sonicscan.org/address/0xeC4671DdD18f88eF7076124895cf42E067f3D4C5) |
| Test WETH              | tWETH  | `0x931753b7A1141d23066fb7a0785ab5c2c1522F43` | [View](https://sonicscan.org/address/0x931753b7A1141d23066fb7a0785ab5c2c1522F43) |
| Test POLLY             | tPOLLY | `0xa83A7118481D3C5A2DDa8ac5F34c8b690Cb0a242` | [View](https://sonicscan.org/address/0xa83A7118481D3C5A2DDa8ac5F34c8b690Cb0a242) |
| Test DPENGU            | tDPENGU| `0x2b0b61AE71d390E8874cE405f05291DD405407ED` | [View](https://sonicscan.org/address/0x2b0b61AE71d390E8874cE405f05291DD405407ED) |
| Test ABSTER            | tABSTER| `0xc7251A2D1bcCF362F6D333977B2817710Aa71707` | [View](https://sonicscan.org/address/0xc7251A2D1bcCF362F6D333977B2817710Aa71707) |
| Test GOONER            | tGOONER| `0x7cDaE08eFA988318feE67342a9CD06449D7651dB` | [View](https://sonicscan.org/address/0x7cDaE08eFA988318feE67342a9CD06449D7651dB) |

---

### 🔹 DEX Mock Contracts
Simplified Automated Market Maker (AMM) contracts for testing swaps and liquidity management.  

| DEX Mock      | Address                                                                 | Explorer Link |
|---------------|-------------------------------------------------------------------------|---------------|
| UniswapMock   | `0x50D1672685E594B27F298Ac5bFACa4F3488AAA9c` | [View](https://sonicscan.org/address/0x50D1672685E594B27F298Ac5bFACa4F3488AAA9c) |
| 1InchMock     | `0xA9b3eD890229E575863514ef8464C0e6a771Bc58` | [View](https://sonicscan.org/address/0xA9b3eD890229E575863514ef8464C0e6a771Bc58) |
| CurveMock     | `0x03a6FE06D6C0C7c9726Ecd079cD9283A37b4c178` | [View](https://sonicscan.org/address/0x03a6FE06D6C0C7c9726Ecd079cD9283A37b4c178) |
| BalancerMock  | `0x2B778181dAB6Db356b00931a6c1833E1450f9655` | [View](https://sonicscan.org/address/0x2B778181dAB6Db356b00931a6c1833E1450f9655) |

---

### 🔹 Existing Pools

| Pool Pair         | Pool ID / Address                                                                 | Explorer Link |
|-------------------|----------------------------------------------------------------------------------|---------------|
| WBTC / USDT       | `0x083828c23a4a388c8cf5eaab6c3482f851cb59a931f33986a35de3c918cd6571` | [View](https://sonicscan.org/address/0x083828c23a4a388c8cf5eaab6c3482f851cb59a931f33986a35de3c918cd6571) |
| WETH / USDC       | `0x097dab714135bb77d763a2c46940e92d30215d4b519a1606108abcbb262a655c` | [View](https://sonicscan.org/address/0x097dab714135bb77d763a2c46940e92d30215d4b519a1606108abcbb262a655c) |
| PEPE / USDT       | `0xe13a819a2714c9c4dcc864a30ddb2de4ed766a3b7f8416cd0c28308e08fc7789` | [View](https://sonicscan.org/address/0xe13a819a2714c9c4dcc864a30ddb2de4ed766a3b7f8416cd0c28308e08fc7789) |
| WSONIC / PENGU    | `0x88e82999197922da97431214fce800bf37c8ae015e5174e31c934d11f100ac7e` | [View](https://sonicscan.org/address/0x88e82999197922da97431214fce800bf37c8ae015e5174e31c934d11f100ac7e) |
| WETH / WSONIC     | `0x14e1dc0dd908a6219a9a6040fe08acf9d81552a0c3ee745576368e3588a6e197` | [View](https://sonicscan.org/address/0x14e1dc0dd908a6219a9a6040fe08acf9d81552a0c3ee745576368e3588a6e197) |
| WSONIC / PEPE     | `0x50d6b263f568e9cd347bab3cbbca27eff5d1754bd2347a595abb6d33df7b96f2` | [View](https://sonicscan.org/address/0x50d6b263f568e9cd347bab3cbbca27eff5d1754bd2347a595abb6d33df7b96f2) |

---

## 🛠 Development Notes

- Contracts were originally built with **Remix IDE**  
- Deployed on **Sonic Mainnet** for frontend and indexer integration testing  
- Simplified implementations for **preview only**  

---

## 📌 Important Notice

⚠️ These contracts are **NOT audited** and **NOT for production use**.  
They are intended only for:  
- Eurlquid frontend demo  
- Indexer testing  
- Developer experimentation  

---

✨ With these mock contracts, developers and testers can safely interact with the **Eurlquid Dapp** on **Sonic Mainnet**, without relying on real protocol contracts.
