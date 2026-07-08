# MD1usd Solana Program

**Program ID:** `3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8`

MD1usd is a USDC-collateralized stablecoin on Solana, built with Anchor 0.30.1.

## Overview

- 1:1 collateralized by USDC (Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB)
- Mint MD1usd by depositing USDC
- Redeem USDC by burning MD1usd
- Part of the MDM1 DeFi ecosystem

## Build

```bash
anchor build --verifiable
```

## Verify

```bash
anchor verify 3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8
```
