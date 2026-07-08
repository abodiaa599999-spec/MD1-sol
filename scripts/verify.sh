#!/bin/bash

# MD1 USD Program Verification Script
# This script verifies the MD1 USD program on Mainnet

set -e

PROGRAM_ID="3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8"
RPC_URL="https://api.mainnet-beta.solana.com"
NETWORK="mainnet-beta"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
echo "╔════════════════════════════════════════════╗"
echo "║   MD1 USD Program Verification Script      ║"
echo "║   Network: Mainnet-Beta                    ║"
echo "╚════════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${YELLOW}Program ID:${NC} $PROGRAM_ID"
echo -e "${YELLOW}RPC URL:${NC} $RPC_URL"
echo -e "${YELLOW}Timestamp:${NC} $(date)"
echo ""

# Check if Solana CLI is installed
if ! command -v solana &> /dev/null; then
    echo -e "${RED}❌ Error: Solana CLI not found${NC}"
    echo "Install from: https://docs.solana.com/cli/install-solana-cli-tools"
    exit 1
fi

# Check if Anchor is installed
if ! command -v anchor &> /dev/null; then
    echo -e "${RED}❌ Error: Anchor CLI not found${NC}"
    echo "Install from: https://www.anchor-lang.com/docs/installation"
    exit 1
fi

echo -e "${BLUE}📦 Building verifiable program...${NC}"
if [ ! -f "MD1sol-clean/Anchor.toml" ]; then
    cd MD1sol-clean
fi

anchor build --verifiable
echo -e "${GREEN}✅ Build completed${NC}"
echo ""

# Compute local program hash
echo -e "${BLUE}🔐 Computing local program hash...${NC}"
LOCAL_HASH=$(sha256sum target/verifiable/md1usd.so | cut -d' ' -f1)
echo -e "${YELLOW}Local Hash:${NC} $LOCAL_HASH"
echo ""

# Download on-chain program
echo -e "${BLUE}📡 Fetching on-chain program from Mainnet...${NC}"
solana program dump "$PROGRAM_ID" program.so --url "$RPC_URL"
echo -e "${GREEN}✅ Program downloaded${NC}"
echo ""

# Compute on-chain program hash
echo -e "${BLUE}🔐 Computing on-chain program hash...${NC}"
ON_CHAIN_HASH=$(sha256sum program.so | cut -d' ' -f1)
echo -e "${YELLOW}On-Chain Hash:${NC} $ON_CHAIN_HASH"
echo ""

# Compare hashes
echo -e "${BLUE}🔍 Comparing hashes...${NC}"
echo ""

if [ "$LOCAL_HASH" = "$ON_CHAIN_HASH" ]; then
    echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║        ✅ VERIFICATION SUCCESSFUL!         ║${NC}"
    echo -e "${GREEN}║    Program is verified and authentic!      ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${GREEN}✅ Hashes match perfectly${NC}"
    echo -e "${GREEN}✅ Code integrity confirmed${NC}"
    echo -e "${GREEN}✅ Program matches source code${NC}"
    
    # Create verification report
    cat > VERIFICATION_REPORT.txt << EOF
╔════════════════════════════════════════════╗
║   MD1 USD Program Verification Report      ║
╚════════════════════════════════════════════╝

Verification Date: $(date)
Program ID: $PROGRAM_ID
Network: Mainnet-Beta
Status: ✅ VERIFIED

Hash Comparison:
├─ Local Program Hash:    $LOCAL_HASH
├─ On-Chain Program Hash: $ON_CHAIN_HASH
└─ Result: MATCH ✅

Verification Conclusion:
✅ The deployed program on Mainnet-Beta matches the source code exactly.
✅ Code integrity is verified.
✅ The program is authentic and has not been modified.

Program Details:
├─ Language: Rust
├─ Framework: Anchor 0.30.1
├─ Toolchain: 1.75.0
├─ Status: Active on Mainnet-Beta
└─ Collateral: USDC (1:1 backed)

Explorers:
├─ Solscan: https://solscan.io/program/$PROGRAM_ID
├─ Solana Beach: https://solanabeach.io/program/$PROGRAM_ID
└─ Explorer: https://explorer.solana.com/address/$PROGRAM_ID

Verification performed with SHA256 hashing.
EOF
    
    echo ""
    echo -e "${BLUE}📄 Verification report saved to: VERIFICATION_REPORT.txt${NC}"
    cat VERIFICATION_REPORT.txt
    
    exit 0
else
    echo -e "${RED}╔════════════════════════════════════════════╗${NC}"
    echo -e "${RED}║        ❌ VERIFICATION FAILED!             ║${NC}"
    echo -e "${RED}║    Hashes do not match                     ║${NC}"
    echo -e "${RED}╚════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${RED}❌ Hash Mismatch${NC}"
    echo ""
    echo -e "${YELLOW}Local:${NC}    $LOCAL_HASH"
    echo -e "${YELLOW}On-Chain:${NC} $ON_CHAIN_HASH"
    echo ""
    echo -e "${RED}This indicates the program on-chain differs from the source code.${NC}"
    echo ""
    
    exit 1
fi

# Cleanup
rm -f program.so
