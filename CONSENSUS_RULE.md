# AIC Consensus Rules
*(Adaptive Intelligence Circle)*  
**Version 1.0 – Draft of Decentralized Governance**

**Author: Nguyen Duc Tri**

**Date: 27 - 10 - 2025**

**License: Apache 2.0**

---

## 1. Purpose
Consensus in AIC is not about uniformity — it is about resonance.  
Members, nodes, and agents reach agreement through *adaptive proof of alignment*, not coercion.

---

## 2. Principle of Consensus
1. **Voluntary Participation:**  
   Every vote, contribution, or decision is voluntary and reversible.

2. **Proof of Contribution:**  
   Weight of a member’s vote = `f(reputation, contribution_hash, validation_score)`  
   - Reputation: Based on verified contributions.  
   - Contribution hash: Every code, design, or proposal has a unique hash.  
   - Validation score: Determined by peer-review nodes.

3. **Local First, Global Later:**  
   Decisions start from subgroups (local clusters) → escalated to global consensus if thresholds are met.

4. **Consensus Thresholds:**  
   - 60% for operational proposals.  
   - 75% for governance changes.  
   - 90% for constitutional (core protocol) updates.

---

## 3. Voting Flow
1. Proposal submitted (`proposal.json`) → automatically hashed.  
2. Members run `VOTING_PROTOCOL.lua` locally → generates consensus signatures.  
3. Each node submits signed decision to the mesh.  
4. Consensus is achieved when signatures meet the defined quorum.

---

## 4. Conflict Resolution
- **Timeout Mechanism:** If no consensus after `T=72h`, the system triggers `ROTATE_ROLE.lua` to change leadership roles temporarily.  
- **Minority Protection:** Minority proposals (≥25%) are stored and re-evaluated after 7 days.  
- **Transparency Clause:** All consensus data are public, encrypted under community keys.

---

## 5. Ethical Layer
- No proposal that restricts autonomy, creativity, or open knowledge shall pass.  
- Any attempt to centralize power = violation of the AIC Manifesto.  
- Consensus exists to *stabilize freedom*, not *govern conformity*.

---

## 6. Meta-Consensus
Every 90 days, the community can vote to rewrite or fork these rules.  
The right to fork = the right to freedom.
