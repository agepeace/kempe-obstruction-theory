---
title: 平面图着色中的 Kempe 障碍传播研究
subtitle: 两定理路径的四色定理完整证明
title_en: Kempe Obstruction Dynamics in Planar Graph Coloring
subtitle_en: A Complete Proof of the Four Color Theorem via Two-Theorem Path
author: 方寸山
version: v0.2
date: 2026-06-12
---

## 摘要 / Abstract

### 【中文摘要】

本文沿"两定理路径"给出四色定理的完整证明。以 Kempe 链与局部四色困难子图（GLFHO）为核心工具，依次建立两条支柱性定理：

- **定理一**（唯一性定理）利用 Jordan 曲线与颜色分隔引理，证明极小5-色平面图的任意5-着色中至多存在唯一的 GLFHO；
- **定理二** 证明 GLFHO 可通过对称拼接操作在5-度顶点邻域间转移。

在此基础上，主证明对极小5-色平面图施行**对称拼接消解法**：

将含唯一 GLFHO 的图 G(n) 与其副本对称拼接，通过极小化着色选择（定理一唯一性保证）使原侧 u 邻域不再是 GLFHO（子图引理：G ⊆ H 保证 G 中限制着色下 u 也非 GLFHO）。此时，**命题 3.1** 严格保证：若 u 非 GLFHO，则 v₁ 与 v₃ 必定在不同的 (1,3)-Kempe 链（反证：若同链则 Jordan 曲线 + 颜色分隔引理强制 u 成为 GLFHO，矛盾），从而**1步** Kempe 链交换即可为 u 完成4-着色，得到 G 的正常4-着色，与 χ(G)=5 矛盾。

证明的逻辑链为：定理一（唯一性）→ 对称拼接（子图引理 + 极小化着色）→ 命题 3.1（非 GLFHO ↔ v₁v₃ 异链，1步交换完成）→ 矛盾。各步均严格论证，无待形式化的悬留假设。

**关键词：** 四色定理；平面图着色；Kempe 链；局部四色困难子图（GLFHO）；极小5-色图；图论

---

### 【Abstract】

This paper presents a complete proof of the Four Color Theorem via a "two-theorem path." Using Kempe chains and Locally Four-Color-Hard Obstructions (GLFHO) as core tools, two pillar theorems are established: 

- **Theorem 1** (Uniqueness Theorem) uses the Jordan Curve Theorem and a color-separation lemma to prove that at most one GLFHO can exist in any 5-coloring of a minimal 5-chromatic planar graph;

- **Theorem 2** proves that a GLFHO can be transferred between 5-degree vertex neighborhoods via a symmetric splicing operation.

The main proof applies a **symmetric splicing resolution method** to a minimal 5-chromatic planar graph: the graph G(n) containing a unique GLFHO at vertex u is symmetrically spliced with its copy; by choosing a minimizing coloring (uniqueness guaranteed by Theorem 1) and applying the **subgraph lemma** (G ⊆ H ensures u is also non-GLFHO under the restricted coloring φ'_G), **Proposition 3.1** then rigorously establishes that: if u is non-GLFHO, then v₁ and v₃ must lie in different (1,3)-Kempe chains (proof by contradiction: if same chain, the Jordan curve + color separation lemma forces u to be GLFHO). Therefore, a single Kempe chain exchange suffices to 4-color u, yielding a proper 4-coloring of G — contradicting χ(G) = 5.

The complete logical chain is: Theorem 1 (uniqueness) → symmetric splicing (subgraph lemma + minimizing coloring) → Proposition 3.1 (non-GLFHO ↔ v₁v₃ in different chains, 1-step exchange completes) → contradiction. Each step is rigorously argued with no outstanding informal assumptions.

**Keywords:** Four Color Theorem; planar graph coloring; Kempe chains; locally four-color-hard obstruction (GLFHO); minimal 5-chromatic graph; graph theory

---

## 引　言

四色定理是图论中最著名的定理之一：对任意地图（等价于封闭球面上的区域划分），仅用四种颜色就可以完成着色，使得相邻区域颜色不同。这个看似简单的命题自1852年被提出后，历经百余年才于1976年由Appel与Haken借助计算机穷举得证——这一结论令许多数学家感到遗憾，因为他们希望有一个不依赖计算机的优雅证明。

本文沿"两定理"路径建立四色定理的完整证明。核心思路是：若平面图中存在一个"局部四色困难子图"（即某区域使得染色困难的局部结构），则通过合理的变换操作，这个困难结构可以被"消除"，从而四色着色总是可以实现的。

### 证明路径的两大支柱

证明路径以两条定理为支柱：

1. **定理一** 极小5-色平面图中，至多只能存在一处局部四色困难子图，不可能同时存在两处或更多。

2. **定理二** 若某5-度顶点邻域为局部四色困难子图，则该困难结构可以通过对称拼接操作"转移"到图中另一个5-度顶点邻域，使原位置不再困难。

### 核心消解机制

以上两条定理共同支撑了四色定理的证明路径。其核心机制为**对称拼接消解法**：

1. **消解**：对极小5-色图 G 中唯一的 GLFHO（中心为5-度顶点 u），选取另一个与 u 不相邻的5-度顶点 v，通过定理二的对称拼接构造，获得 G - {v} 的正常4-着色，且该着色下 u 处无 GLFHO。

2. **扩展**：从 G - {v} 的4-着色扩展到 G 的4-着色。由于 v 是5-度顶点（5个邻居使用至多4种颜色），需对 v 的邻域进行 Kempe 链分析以完成扩展。

### 关于本文的状态

本文给出四色定理的一条完整证明路径，各核心步骤均已严格论证：

- **定理一**（唯一性）：C2b、C3 情形的严格排除已在正文中详细展开
- **定理二**（对称拼接消解）：子图引理 + 极小化着色论证已完整给出
- **命题 3.1**（有限 Kempe 可达性）：通过反证法（Jordan 曲线 + 颜色分隔引理）严格证明非 GLFHO 时 1 步交换完成，无待形式化的悬留步骤

作者欢迎同行评议与形式化验证，也欢迎对证明中任何步骤的质疑与改进建议。

