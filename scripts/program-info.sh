#!/bin/bash

# MD1 USD Program Info Script
# Display program information on Mainnet

set -e

PROGRAM_ID="3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8"
RPC_URL="https://api.mainnet-beta.solana.com"

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}"
echo "╔════════════════════════════════════════════╗"
echo "║   MD1 USD Program Information              ║"
echo "║   Network: Mainnet-Beta                    ║"
echo "╚════════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${YELLOW}Program ID:${NC} $PROGRAM_ID"
echo ""

echo -e "${GREEN}📋 Program Details:${NC}"
solana program show "$PROGRAM_ID" --url "$RPC_URL"

echo ""
echo -e "${GREEN}📊 Program Account Data:${NC}"
solana account "$PROGRAM_ID" --url "$RPC_URL" --output json | jq '.' || true

echo ""
echo -e "${YELLOW}Repository:${NC} https://github.com/abodiaa599999-spec/MD1-sol"
echo -e "${YELLOW}Explorers:${NC}"
echo "  - Solscan: https://solscan.io/program/$PROGRAM_ID"
echo "  - Solana Beach: https://solanabeach.io/program/$PROGRAM_ID"
echo "  - Explorer: https://explorer.solana.com/address/$PROGRAM_ID"
