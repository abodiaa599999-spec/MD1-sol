# MD1 USD - Solana Stablecoin

**Program ID:** `3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8`

**Network:** Mainnet-Beta ✅

MD1 USD is a fully collateralized stablecoin on Solana, backed 1:1 by USDC. Built with Anchor 0.30.1.

## Overview

- **1:1 USDC collateralization** - Every MD1 USD is backed by 1 USDC
- **Collateral:** USDC (Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB)
- **Mint:** Deposit USDC → Receive MD1 USD
- **Redeem:** Burn MD1 USD → Receive USDC
- **Fully On-Chain:** Transparent, immutable, auditable

## Quick Start

### Prerequisites

```bash
Rust 1.75.0+
Solana CLI 1.18.26+
Anchor Framework 0.30.1+
```

### Build

```bash
# Install dependencies
cargo build

# Build the program
anchor build

# Build with verification flag
anchor build --verifiable
```

### Test

```bash
anchor test
```

### Verify (Mainnet)

```bash
# View program on-chain
solana program show 3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8 \
  --url https://api.mainnet-beta.solana.com

# Verify program matches source
bash scripts/verify.sh
```

## Program Structure

```
programs/md1usd/
├── src/
│   ├── lib.rs              # Entry point
│   ├── instructions/
│   │   ├── mod.rs
│   │   ├── initialize.rs   # Initialize vault and mint
│   │   ├── mint.rs         # Mint MD1 USD
│   │   └── redeem.rs       # Redeem MD1 USD for USDC
│   ├── state/
│   │   └── mod.rs          # Vault state
│   ├── errors.rs           # Error codes
│   └── constants.rs        # Configuration
└── tests/
    └── integration_tests.rs # Integration tests
```

## Instructions

### 1. Initialize

Initialize the vault and MD1 USD mint:

```rust
pub fn initialize(ctx: Context<Initialize>) -> Result<()>
```

### 2. Mint

Deposit USDC and receive MD1 USD (1:1 ratio):

```rust
pub fn mint(ctx: Context<MintTokens>, amount: u64) -> Result<()>
```

### 3. Redeem

Burn MD1 USD and receive USDC back:

```rust
pub fn redeem(ctx: Context<RedeemTokens>, amount: u64) -> Result<()>
```

## Explorers

View the program on Solana explorers:

- **Solscan:** https://solscan.io/program/3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8
- **Solana Beach:** https://solanabeach.io/program/3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8
- **Explorer:** https://explorer.solana.com/address/3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8

## Security

- ✅ Proper account validation
- ✅ Overflow/underflow protection
- ✅ Authorization checks
- ✅ Input validation
- ✅ On-chain verification available

## Deployment

The program is currently deployed and operational on Mainnet-Beta.

**Deployment Details:**
| Field | Value |
|-------|-------|
| Program ID | 3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8 |
| Network | Mainnet-Beta |
| Status | ✅ Active |
| Language | Rust (Solana) |
| Framework | Anchor 0.30.1 |

## License

MIT License - See LICENSE file for details

## Support

- 📖 [Documentation](./VERIFICATION.md)
- 🐛 [Report Issues](https://github.com/abodiaa599999-spec/MD1-sol/issues)
- 💬 [Discussions](https://github.com/abodiaa599999-spec/MD1-sol/discussions)

---

Built with ❤️ on Solana
