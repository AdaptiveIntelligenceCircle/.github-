# **MAINTAINERS.md**

## **Overview**

This document defines the maintainership structure, responsibilities, decision-making model, and governance rules for the **Adaptive Intelligence Circle (AIC)** project and its subprojects.

AIC follows an open, merit-based governance model inspired by the Linux Foundation and CNCF.

---

# **1. Roles and Definitions**

### **1.1 Maintainer**

A Maintainer is an individual with the technical expertise, project history, and community trust to:

* Approve pull requests
* Review and manage contributions
* Guide architectural decisions
* Enforce quality, security, and specification standards
* Participate in governance discussions

Maintainers have **write access** to the repository.

---

### **1.2 Core Maintainer**

A Core Maintainer is a senior maintainer with responsibility for:

* Major architectural direction
* Security-critical code
* Release cycles
* Roadmaps and cross-module consistency
* Final approval over governance changes

Core Maintainers have **admin access** to the project.

---

### **1.3 Contributor**

Anyone who submits PRs, issues, documentation, or code improvements.
Contributors do not have write access unless promoted.

---

### **1.4 Steering Group (Optional for AIN level)**

For future Foundation-level scaling, a Steering Group may be established to:

* Oversee long-term vision
* Coordinate between Working Groups
* Handle partnerships (e.g., Linux Foundation, xAI, EA orgs, research labs)
* Ensure strategic alignment and ethics

Initially, the Steering Group consists of Core Maintainers.

---

# **2. Maintainer List**

> ⚠️ *Temporary list — to be expanded as the community grows.*

### **Core Maintainers**

| Name               | Role                            | Areas                                                                  | Contact                  |
| ------------------ | ------------------------------- | ---------------------------------------------------------------------- | ------------------------ |
| **Nguyễn Đức Trí** | Project Founder, Lead Architect | AIC Core, AIN architecture, security, kernel code, AI behavior systems | (ndtribk@gmail.com) |

### **Maintainers**

| Name          | Role                   | Areas                                                                     |
| ------------- | ---------------------- | ------------------------------------------------------------------------- |
| (To be added) | Module maintainer      | Each submodule (analytics, behavior, protection, runtime, language, etc.) |
| (To be added) | Security reviewer      | Core/Security, threat analysis                                            |
| (To be added) | Infrastructure & CI/CD | Build system, testing                                                     |
| (To be added) | Documentation          | README, docs, specs                                                       |

*(You can later require contributors to apply or be nominated.)*

---

# **3. Responsibilities**

### **3.1 Maintainer Responsibilities**

* Review pull requests within reasonable time
* Ensure contributions meet coding standards
* Maintain module stability and backward compatibility
* Address critical issues or security reports
* Participate in release planning
* Mentor new contributors

---

### **3.2 Core Maintainer Responsibilities**

* Approve breaking changes
* Approve release tags
* Manage governance proposals
* Final call on architecture and specification
* Security incident response (+ coordinate hotfix releases)
* Strategic direction of the project

---

# **4. Code Review Rules**

### **4.1 Required Approvals**

* Normal changes: **1 Maintainer** approval
* Security, Architecture, or API changes: **1 Core Maintainer**
* Breaking changes: **2 Core Maintainers** (or Founder + Core Maintainer)

---

### **4.2 PR Merge Requirements**

Every PR must meet:

* Pass CI/CD
* Conform to project coding style
* Follow CONTRIBUTING.md
* Author has completed CLA/DCO

Maintainers may request:

* Additional tests
* Security audit
* Documentation updates

---

# **5. Decision-Making Model**

### **5.1 Lazy Consensus**

Default governance model (like Apache, CNCF):

* Silence = agreement
* Only disagreements require discussion

---

### **5.2 Voting**

Used only when consensus fails:

* 1 Maintainer = 1 vote
* Core Maintainer votes override ordinary maintainer votes
* Majority rules

---

### **5.3 Founder Veto Rule (Startup Phase Only)**

To maintain architectural coherence during early stages:

* Project Founder may overrule decisions that risk fragmentation, security, or mission integrity
* This rule is removed once AIC matures into AIN (Foundation stage)

---

# **6. Becoming a Maintainer**

### **6.1 Requirements**

A contributor becomes a maintainer by:

* Submitting significant, high-quality contributions
* Demonstrating understanding of project architecture
* Participating in reviews and discussions
* Showing responsibility and respect toward community standards

---

### **6.2 Process**

1. Nomination by an existing maintainer
2. Review by Core Maintainers
3. Approval by majority
4. Access granted and listed in this file

---

# **7. Removing a Maintainer**

A maintainer may be removed for:

* Inactivity > 12 months
* Repeated violation of security or quality standards
* Toxic behavior or code of conduct violations
* Requesting to step down

Removal is voted on by Core Maintainers.

---

# **8. Subprojects & Working Groups**

When AIC scales to AIN, each major domain may have its own maintainer set:

* **Behavior Engine WG**
* **Security & Self-defense WG**
* **Adaptive Runtime WG**
* **Plugin & Extension WG**
* **Distributed AIN Protocol WG**
* **Language & Compiler WG**
* **Simulation & Sandbox WG**
* **AIForDriver WG**

Each WG will have:

* 1 Lead Maintainer
* 1–3 Reviewers
* 1 Core Liaison

---

# **9. Security Policy**

Security-critical reports follow:

* **private email to Core Security Maintainer**
* Patch review under confidentiality
* Hotfix release process within 24–72 hours

A full SECURITY.md will complement this file.

---

# **10. Governance Evolution**

When AIC evolves into the **Adaptive Intelligence Network (AIN)** and forms a Foundation:

* Steering Group replaces Founder Veto
* Working Groups become official
* Independent Technical Advisory Council (TAC) may be formed
* Governance aligns with LF/CNCF models

---

# **11. License**

This project is governed under:

* **GNU GPL-v3.0**
* Or dual-license model specified in LICENSE.md

Maintainers ensure all contributions comply.

---

## **End of Document**

---

