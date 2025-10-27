# AIC Governance Protocol  
*(Adaptive, Transparent, and Trust-Based)*

**Version:** 1.0  

**Maintained by:** AIC Core Protocol Custodians  

**License:** Apache 2.0  

---

## I. Purpose

This document defines the **governance architecture** for AIC —  
a decentralized, self-regulating network designed to sustain open collaboration, ethical AI development, and adaptive consensus.

---

## II. Core Roles

| Role | Description | Duration |
|------|--------------|-----------|
| **Custodian** | Maintains core repository integrity; enforces governance updates. | 6 months (rotating) |
| **Contributor** | Develops, reviews, or documents modules within AIC. | Continuous |
| **Observer** | Participates in discussions, learns, and can propose issues. | Open |

Rotation is handled automatically through the script `ROTATE_ROLE.lua`,  
which computes trust and contribution scores to ensure fair leadership cycling.

---

## III. Governance Layers

1. **Root Charter**  
   - Defined in `DECLARATION_OF_AIC_AUTONOMY.md`.  
   - Immutable except by 90% community consensus.  

2. **Operational Layer**  
   - Defined in this `GOVERNANCE.md`.  
   - Controls versioning, voting, and conflict resolution.  

3. **Ethical Layer**  
   - Overseen by the Ethics Node.  
   - Verifies all commits and policies against human-aligned standards.  

---

## IV. Decision-Making

- **Consensus Threshold:**  
  `Proposal accepted if ≥70% active contributors approve via vote.`  

- **Voting Mechanism:**  
  Implemented via `VOTING_PROTOCOL.lua`, which verifies contribution hashes.  

- **Proposal Flow:**  
