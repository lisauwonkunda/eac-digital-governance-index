-- ════════════════════════════════════════════════════════════════════════
-- DPI READINESS INDEX — COMPUTED CAPABILITY & AMBITION SCORES
-- Run 01_schema.sql and 02_data_raw_indicators.sql before this file.
--
-- Each score (1-10) is the analyst-assigned rating derived by applying
-- the scoring_rubric bands in 01_schema.sql to the raw indicator data.
-- capability_score = current state; ambition_score = stated policy target.
-- All 36 cells (3 countries x 12 sub-indicators) are populated here.
-- ════════════════════════════════════════════════════════════════════════

USE dpi_readiness_index;

-- D1: Infrastructure Foundation
INSERT INTO computed_scores (country, si_code, capability_score, ambition_score) VALUES
('Kenya',    '1.1', 6, 7),
('Rwanda',   '1.1', 5, 8),
('Tanzania', '1.1', 4, 6),
('Kenya',    '1.2', 8, 8),
('Rwanda',   '1.2', 6, 9),
('Tanzania', '1.2', 6, 8),
('Kenya',    '1.3', 5, 6),
('Rwanda',   '1.3', 4, 7),
('Tanzania', '1.3', 3, 5);

-- D2: State Capacity for Digital Governance
INSERT INTO computed_scores (country, si_code, capability_score, ambition_score) VALUES
('Kenya',    '2.1', 7, 7),
('Rwanda',   '2.1', 6, 9),
('Tanzania', '2.1', 4, 6),
('Kenya',    '2.2', 6, 7),
('Rwanda',   '2.2', 7, 8),
('Tanzania', '2.2', 2, 6),
('Kenya',    '2.3', 4, 6),
('Rwanda',   '2.3', 6, 8),
('Tanzania', '2.3', 3, 5);

-- D3: Digital Public Stack Maturity
INSERT INTO computed_scores (country, si_code, capability_score, ambition_score) VALUES
('Kenya',    '3.1', 6, 7),
('Rwanda',   '3.1', 9, 9),
('Tanzania', '3.1', 3.5, 7.5),
('Kenya',    '3.2', 6, 7),
('Rwanda',   '3.2', 9, 9),
('Tanzania', '3.2', 2, 7),
('Kenya',    '3.3', 7, 7),
('Rwanda',   '3.3', 9, 9),
('Tanzania', '3.3', 5, 8);

-- D4: Political Economy and Sustainability
INSERT INTO computed_scores (country, si_code, capability_score, ambition_score) VALUES
('Kenya',    '4.1', 5, 6),
('Rwanda',   '4.1', 4, 7),
('Tanzania', '4.1', 3, 5),
('Kenya',    '4.2', 7, 7),
('Rwanda',   '4.2', 6, 8),
('Tanzania', '4.2', 3, 6),
('Kenya',    '4.3', 6, 7),
('Rwanda',   '4.3', 9, 10),
('Tanzania', '4.3', 3, 7);

-- ── VERIFICATION ────────────────────────────────────────────────────────

-- Expect 36 (3 countries x 12 sub-indicators)
SELECT COUNT(*) AS scored_cells_out_of_36 FROM computed_scores;

-- Should return zero rows if every country x indicator combo is filled
SELECT c.country, sr.si_code, sr.si_name
FROM (SELECT 'Kenya' AS country UNION SELECT 'Rwanda' UNION SELECT 'Tanzania') c
CROSS JOIN scoring_rubric sr
LEFT JOIN computed_scores cs
    ON cs.country = c.country AND cs.si_code = sr.si_code
WHERE cs.id IS NULL
ORDER BY sr.si_code, c.country;
