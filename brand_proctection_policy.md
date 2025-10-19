# 🛡️ Branch Protection Policy
**Organization:** Adaptive Intelligence Circle  
**Repository Scope:** All active repositories under the organization  
**Last Updated:** 2025-10-19  

---

## 🎯 Purpose
This policy defines how branches — especially the `main` (or `master`) branch — are protected to ensure:
- Code integrity  
- Transparent collaboration  
- Controlled contribution flow  
- Secure deployment of Adaptive AI and IBCS systems  

Our repositories serve as both **research platforms** and **production-grade systems**, so branch management is critical for long-term stability.

---

## 🔹 Protected Branch: `main`
All commits to the `main` branch must go through a **Pull Request (PR)** and be **approved** before merging.

### Required Rules
| Rule | Status | Description |
|------|---------|-------------|
| Require a pull request before merging | ✅ | Prevents direct commits to `main`. |
| Require approvals | ✅ (≥1) | At least one review approval required. |
| Dismiss stale approvals | ✅ | If new commits are pushed, PRs must be reviewed again. |
| Require review from CODEOWNERS | ✅ | Modules must be approved by their responsible maintainers. |
| Require approval of most recent push | ✅ | Ensures latest commit is verified. |
| Require status checks | ✅ | All CI checks (build/test/lint) must pass. |
| Require branches up to date before merging | ✅ | Keeps branch aligned with latest `main`. |
| Require signed commits | ✅ | Every commit must be GPG/SSH verified. |
| Require linear history | ✅ | Prevents merge commits — clean history. |
| Restrict who can push | ✅ | Only Core Team and trusted bots. |
| Allow force pushes / deletions | ❌ | Disabled to prevent data loss. |

---

## 🧩 Status Checks
Each PR must pass all required CI pipelines before merging:
- **Build Pipeline:** Compiles and checks code quality.  
- **Test Pipeline:** Runs unit/integration tests.  
- **Security Scan:** Detects vulnerabilities in dependencies.  

Example workflow files are defined in `.github/workflows/`.

---

## 👥 Roles and Responsibilities
| Role | Permissions | Description |
|------|--------------|-------------|
| **Owner / Admin** | Full | Manage protection rules, approve emergency merges. |
| **Core Maintainer** | Review + Merge | Approve and merge PRs in assigned modules. |
| **Contributor** | Create PR | Submit new code, must pass review + CI. |
| **Automation Bot** | CI Checks | Execute workflows; no write privileges. |

---

## 📁 CODEOWNERS
Each repository should define module-specific maintainers in a `CODEOWNERS` file.  
Example:
