# 🪰 FLY  
### The On-Chain PvP Game of the Black Flag Universe  

**FLY** is a turn-based, on-chain PvP card and strategy game built on **Solana**.  
Players duel each other using custom fly-themed decks and stake **$FLY**, the native token of the Swarm.  
Every match settles transparently on-chain — no servers, no middlemen, just skill, strategy, and swarm pride.

---

## 🎮 Core Concept
- **Genre:** On-chain PvP / turn-based card strategy  
- **Chain:** Solana (Anchor + SPL)  
- **Token:** $FLY  
- **Goal:** Out-maneuver your opponent, shed your hand, and claim the pot.  

### Match Flow
1. Connect wallet → join the arena.  
2. Stake entry fee in $FLY.  
3. Receive a hand of cards (actions, counters, chaos).  
4. Take alternating turns (30-second timer per turn).  
5. Winner takes the pot — automatic settlement, zero trust required.

---

## 🕐 Turn Timer & Stall Rule
- Each turn is **30 seconds**.  
- If the active player fails to act before the timer expires:  
  - They **auto-draw 1 card** from the deck.  
  - Their **turn ends immediately** and passes to the opponent.  
  - Their `stall_count` increases by +1.  
- **3 stalls = automatic forfeit** (opponent wins, pot distributed normally).  
- If both players stall back-to-back twice (A→B→A→B), the match **auto-draws** — pot splits 50/50, 10% ecosystem rake still applies.  
- If a player **commits a move** but fails to **reveal** it before the deadline, the opponent can **claim a timeout win**.  
- Timer resets every valid move; all events are logged on-chain.

---

## 💰 $FLY Token Integration

| Use | Description | Flow |
|------|--------------|------|
| **Match Entry** | Both players stake FLY to enter a duel. | Winner receives 90 %; 10 % follows ecosystem split. |
| **Card Crafting / Cosmetics** | Burn FLY to mint alternate cards or skins. | Pure sink, boosts rarity. |
| **Resources (future)** | Scrap / Energy used in advanced modes. | Split = 30 % burn / 50 % treasury PDA / 20 % ops multisig. |
| **Faction Seasons** | FLY funds regional wars & tournaments. | Expands meta-economy. |

**Economy Split (confirmed)**  
- 🔥 30 % Burn  
- 🏦 50 % Treasury PDA (game rewards & events)  
- ⚙️ 20 % Ops Multisig (development & infrastructure)

---

### 🪙 $FLY Token Contract
| Network | Address | Type |
|----------|----------|------|
| **Solana Mainnet** | `GuESBZaZsSeDLJK8vKmuhK3rSCbKPiC6xwPpviUPxSqN` | SPL Token |
| **Explorer** | [View on Solscan](https://solscan.io/token/GuESBZaZsSeDLJK8vKmuhK3rSCbKPiC6xwPpviUPxSqN) | — |

> ⚠️ Always verify before transacting — this is the **only official $FLY token address**.

---

## 🧱 On-Chain Architecture (Anchor)

| Account | Purpose |
|----------|----------|
| **Match** | player1, player2, pot_fly, winner, status, timer, stall counts |
| **Player** | elo, wins, losses, badges |
| **Config** | fly_mint, bps split, treasury PDA, ops multisig, authority, turn_timer_s |
| **Treasury Vault (PDA)** | holds 50 % share, program-controlled |
| **Resource Vault** *(future)* | handles Scrap / Energy purchases |

**Instructions**
- `create_match(entry_fee)`  
- `join_match(match_id)`  
- `submit_move(move_hash)` / `reveal_move(move)` (commit-reveal system)  
- `handle_stall(match_id)` *(auto-draw + pass turn)*  
- `claim_timeout_win(match_id)` *(opponent didn't reveal)*  
- `settle_match(match_id, winner)`  
- `buy_resource(kind, fly_amount)` (future feature)

All burns, transfers, stalls, and payouts emit events for transparency.

---

## 🏗️ Repo Layout (Windsurf Project)
```plaintext
fly/
├── app/              # Next.js frontend (React UI, wallet adapter)
├── programs/         # Anchor smart contracts
├── public/           # Art, card images, sounds
├── scripts/          # Deploy + test helpers
└── README.md
```

---

## 🚀 Development Plan

### **Phase 1 — PvP MVP (1 week)**
- 1 v 1 duel prototype (stake, play, settle).  
- 30 s turn timer + auto-draw rule.  
- Devnet only.  
- Simple random "card" logic.  
- Verify burn / treasury / ops split.

### **Phase 2 — Card System (Weeks 2–3)**
- Real deck mechanics + action cards.  
- Leaderboard & ELO.  
- Cosmetic FLY sinks.

### **Phase 3 — Faction Season (2–3 months)**
- Multi-player leagues / tournaments.  
- Resource purchases (Scrap / Energy).  
- Treasury-funded rewards & NFT badges.  

---

## 🏴 Season Framework

| Season | Duration | Focus |
|---------|-----------|--------|
| **Test Flight** | 1 week | MVP duel tests |
| **Pilot Season** | 4 weeks | Card rules + leaderboard |
| **Operation 1+** | 8–12 weeks | Faction wars, tournaments, NFTs |

Persistent: ELO, badges, player stats  
Reset: match history, season leaderboards  

---

## 🔒 Security & Governance
- Treasury Vault = **Program Derived Address (PDA)** — only program logic moves funds.  
- Ops Wallet = **3/5 multisig**.  
- Config PDA stores BPS split (30/50/20) and authorized updater.  
- Future DAO can vote on splits, seasons, and rule updates.

---

## 🪰 Branding
- **Name:** FLY  
- **Universe:** Operation Black Flag  
- **Taglines:**  
  - *Play FLY. Earn FLY. Be the FLY.*  
  - *You FLY — or you fall.*  
- **Lore snippet:**  
  > "In the age of decay, only the Swarm survives.  
  > The weak crawl. The brave FLY."  

**Logo Prompt (AI-gen / design brief)**  
> "Minimalist wordmark 'FLY' with stylized wings from the F and Y, black-silver palette, sharp military aesthetic, suitable for on-chain PvP branding."

---

## 🤝 Community & Transparency
- Public dashboard: FLY burned 🔥, Treasury balance 🏦, Ops wallet activity ⚙️.  
- Monthly **Ops Report** (costs, bounties, updates).  
- Open contribution guide for modding & card ideas.

---

### ✳️ Summary
> **FLY** — the on-chain PvP card and strategy game of the Black Flag universe.  
> Stake $FLY, outsmart your opponent, and earn glory for the Swarm.  
> **30 seconds to act — draw or fall.**  
> *Only the brave FLY.*
