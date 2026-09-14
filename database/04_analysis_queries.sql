-- ════════════════════════════════════════════════════════════════════════
-- DPI READINESS INDEX — ANALYSIS QUERIES
-- Run after 01_schema.sql, 02_data_raw_indicators.sql, and
-- 03_data_computed_scores.sql. These are the queries behind the headline
-- findings in the policy brief.
-- ════════════════════════════════════════════════════════════════════════

USE dpi_readiness_index;

-- ── 1. Headline composite ranking ───────────────────────────────────────
-- Weighted composite capability, ambition, and alignment gap per country.
-- This is the single most important table in the whole project.
SELECT * FROM composite_index;

-- ── 2. Dimension-level breakdown ────────────────────────────────────────
-- Where each country is strong/weak across the four DPI dimensions.
SELECT * FROM dimension_summary
ORDER BY country, dimension;

-- ── 3. Full indicator-level detail with alignment gaps ─────────────────
-- Every sub-indicator, every country, sorted so it reads like a report table.
SELECT
    cs.country          AS Country,
    sr.si_code           AS `Si Code`,
    sr.si_name           AS `Si Name`,
    sr.dimension         AS Dimension,
    sr.transferability   AS Transferability,
    cs.capability_score  AS `Capability Score`,
    cs.ambition_score    AS `Ambition Score`,
    ROUND(cs.ambition_score - cs.capability_score, 2) AS `Alignment Gap`
FROM computed_scores cs
JOIN scoring_rubric sr ON cs.si_code = sr.si_code
ORDER BY cs.country, sr.si_code;

-- ── 4. Transferability breakdown ────────────────────────────────────────
-- How many sub-indicators are high/conditional/low transferability --
-- i.e. how much of Kenya's or Rwanda's approach could realistically
-- transfer to Tanzania without deep structural change.
SELECT * FROM transferability_summary;

-- ── 5. Tanzania deep-dive: where the alignment gap is largest ─────────
-- Tanzania consistently shows the widest ambition-capability gaps --
-- this isolates exactly which sub-indicators drive that finding.
SELECT
    sr.si_code,
    sr.si_name,
    sr.dimension,
    sr.transferability,
    cs.capability_score,
    cs.ambition_score,
    ROUND(cs.ambition_score - cs.capability_score, 2) AS alignment_gap
FROM computed_scores cs
JOIN scoring_rubric sr ON cs.si_code = sr.si_code
WHERE cs.country = 'Tanzania'
ORDER BY alignment_gap DESC;

-- ── 6. Highest-leverage transferable investments for Tanzania ──────────
-- Sub-indicators marked "high" transferability where Tanzania also has
-- the largest capability gap -- these are the most actionable levers,
-- since they don't require Rwanda- or Kenya-specific political conditions.
SELECT
    sr.si_code,
    sr.si_name,
    sr.dimension,
    cs.capability_score,
    ROUND(cs.ambition_score - cs.capability_score, 2) AS alignment_gap
FROM computed_scores cs
JOIN scoring_rubric sr ON cs.si_code = sr.si_code
WHERE cs.country = 'Tanzania'
  AND sr.transferability = 'high'
ORDER BY alignment_gap DESC;
