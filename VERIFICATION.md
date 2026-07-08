# MD1 USD Program Verification Guide

**Program ID:** `3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8`

**Network:** Mainnet-Beta ✅

**Status:** Ready for Verification

## Quick Verification

### 🤖 Automated Verification (GitHub Actions)

The program is automatically verified on every push to `main`:

**Process:**
1. ✅ Source code is built with Anchor
2. ✅ Tests are executed
3. ✅ Verifiable binary is created
4. ✅ On-chain program is downloaded
5. ✅ SHA256 hashes are compared
6. ✅ Verification report is generated
7. ✅ Solscan package is created

**View Results:**
- 📊 **GitHub Actions:** https://github.com/abodiaa599999-spec/MD1-sol/actions
- 📥 **Download Artifacts:** Check the most recent workflow run

### 🔬 Manual Verification

Run the verification script locally:

```bash
# Make script executable
chmod +x scripts/verify.sh

# Run verification
bash scripts/verify.sh
```

**Script Output:**
- ✅ Local program hash
- ✅ On-chain program hash
- ✅ Hash comparison result
- ✅ Verification status report

### 🛠️ Manual Verification Steps

**Step 1: Build verifiable program**
```bash
cd MD1sol-clean
anchor build --verifiable
```

**Step 2: Download on-chain program**
```bash
solana program dump 3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8 program.so \
  --url https://api.mainnet-beta.solana.com
```

**Step 3: Compare hashes**
```bash
# Get local build hash
sha256sum MD1sol-clean/target/verifiable/md1usd.so

# Get on-chain program hash
sha256sum program.so
```

**Step 4: Verify**
- ✅ If hashes match → **Program is verified!**
- ❌ If hashes differ → Program or build differs

## What This Means

| Check | Meaning |
|-------|---------|
| ✅ **Code Integrity** | Deployed program matches source code exactly |
| ✅ **No Modifications** | Program has not been altered since deployment |
| ✅ **Transparent** | Anyone can verify the code independently |
| ✅ **Reproducible** | Build is deterministic and repeatable |

## Verification Artifacts

### 📦 Solscan Verification Package (ZIP)

**Contains:**
- ✅ Complete source code
- ✅ Build configuration (Anchor.toml, Cargo.toml, Cargo.lock)
- ✅ Rust toolchain file
- ✅ Verifiable program binary
- ✅ IDL files
- ✅ Verification report
- ✅ Scripts and documentation
- ✅ Build artifacts

**Download from:** GitHub Actions artifacts

**Upload to:** Solscan or other explorers

### 📋 Verification Report

**Includes:**
- ✅ Program ID and network
- ✅ Build timestamp (UTC)
- ✅ Local binary SHA256 hash
- ✅ On-chain binary SHA256 hash
- ✅ Hash comparison result
- ✅ Verification status
- ✅ Repository link

**Location:** `verification_report.txt` in artifacts

## 🔗 Network Information

| Property | Value |
|----------|-------|
| **Network** | Mainnet-Beta |
| **Program ID** | 3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8 |
| **Status** | ✅ Verifiable |
| **Language** | Rust |
| **Framework** | Anchor 0.30.1 |
| **Toolchain** | 1.75.0 |

## 🔍 Block Explorers

View the program on major Solana explorers:

- **Solscan:** https://solscan.io/program/3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8
- **Solana Beach:** https://solanabeach.io/program/3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8
- **Solana Explorer:** https://explorer.solana.com/address/3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8

## 🔐 Security Considerations

| Aspect | Details |
|--------|---------|
| **Immutability** | Solana programs are immutable unless upgrade authority is retained |
| **Transparency** | All on-chain transactions are publicly visible |
| **Open Source** | Code is publicly available for audit |
| **Reproducibility** | Anyone can rebuild and verify independently |

## ⚙️ Build Environment

**Required Versions:**
- Rust: 1.75.0
- Solana CLI: 1.18.26
- Anchor: 0.30.1
- Node.js: 16+ (for npm)

**Installation:**
```bash
# Rust (see rust-toolchain.toml)
rustup install 1.75.0
rustup default 1.75.0

# Solana CLI
sh -c "$(curl -sSfL https://release.anza.xyz/v1.18.26/install)"

# Anchor
npm install -g @coral-xyz/anchor-cli@0.30.1
```

## 🐛 Troubleshooting

### "Hash Mismatch" Error

**Possible Causes:**
1. Different Rust/Solana versions
2. Updated dependencies
3. Build environment differences

**Solution:**
```bash
# Use correct Rust version
rustup default 1.75.0

# Lock dependencies
cargo update -p <package> --precise <version>

# Build verifiable
anchor build --verifiable
```

### Verification Script Fails

**Check Prerequisites:**
```bash
# Solana CLI
solana --version  # Should be 1.18.26+

# Anchor
anchor --version  # Should be 0.30.1+

# Rust
rustc --version   # Should be 1.75.0+
```

**Check RPC Connection:**
```bash
solana config get
# Ensure you're using correct RPC URL
```

### Program Download Fails

**Reason:** Program not yet deployed to Mainnet

**Status:** Check GitHub Actions run for details

**Next Steps:** Wait for deployment confirmation

## 📚 Resources

- 📖 [Main README](README.md)
- 🔗 [GitHub Repository](https://github.com/abodiaa599999-spec/MD1-sol)
- 📥 [Solscan Upload Guide](SOLSCAN_GUIDE.md)
- 🐛 [Report Issues](https://github.com/abodiaa599999-spec/MD1-sol/issues)
- 💬 [Discussions](https://github.com/abodiaa599999-spec/MD1-sol/discussions)
- 📚 [Anchor Docs](https://www.anchor-lang.com/)
- 🟫 [Solana Docs](https://docs.solana.com/)

## 🎯 Next Steps

1. ✅ **Build:** Run `anchor build --verifiable`
2. ✅ **Verify:** Run `bash scripts/verify.sh`
3. ✅ **Upload:** Upload ZIP to Solscan
4. ✅ **Monitor:** Check verification status

## 📊 Verification Status Timeline

| Stage | Status | Details |
|-------|--------|---------|
| **Source Code** | ✅ Available | https://github.com/abodiaa599999-spec/MD1-sol |
| **Build System** | ✅ Ready | Anchor 0.30.1, Rust 1.75.0 |
| **Verifiable Build** | ✅ Generated | Reproducible binaries |
| **On-Chain Program** | ⏳ Pending | Awaiting deployment |
| **Hash Verification** | ⏳ Pending | Will verify on deployment |
| **Solscan Verification** | ⏳ Pending | Will upload upon deployment |

---

**Last Updated:** 2026-07-08

**Verification Status:** Ready for deployment and verification
