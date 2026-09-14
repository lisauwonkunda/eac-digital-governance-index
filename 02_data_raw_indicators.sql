-- ════════════════════════════════════════════════════════════════════════
-- DPI READINESS INDEX — RAW SOURCED INDICATOR DATA
-- Run 01_schema.sql before this file.
--
-- Each row is one country x sub-indicator x year data point, with full
-- source attribution (source name + URL) and a data_quality flag:
--   hard        = official government/multilateral statistic
--   estimated   = third-party estimate (GSMA, Kepios/DataReportal, etc.)
--   qualitative = analyst-coded from a scale/rubric rather than a raw number
-- ════════════════════════════════════════════════════════════════════════

USE dpi_readiness_index;

-- ── D1: Infrastructure Foundation ──────────────────────────────────────

-- 1.1 Mobile Internet Penetration (% of population using the internet)
INSERT INTO raw_indicators
(country, dimension, si_code, si_name, raw_value, unit, data_type, year, source, source_url, data_quality)
VALUES
('Kenya', 'D1: Infrastructure Foundation', '1.1',
 'Mobile Internet Penetration', 32.7,
 '% of population using internet', 'quantitative', 2023,
 'DataReportal, Digital 2023: Kenya (Kepios analysis)',
 'https://datareportal.com/reports/digital-2023-kenya', 'estimated'),

('Rwanda', 'D1: Infrastructure Foundation', '1.1',
 'Mobile Internet Penetration', 30.5,
 '% of population using internet', 'quantitative', 2023,
 'DataReportal, Digital 2023: Rwanda (Kepios analysis)',
 'https://datareportal.com/reports/digital-2023-rwanda', 'estimated'),

('Tanzania', 'D1: Infrastructure Foundation', '1.1',
 'Mobile Internet Penetration', 29.06,
 '% of population using internet', 'quantitative', 2023,
 'World Bank, Individuals using the Internet (% of population)',
 'https://data.worldbank.org/indicator/IT.NET.USER.ZS?locations=TZ', 'hard');

-- 1.2 Mobile Money Penetration
-- ⚠ GAP: original raw source rows for this indicator were not recovered.
-- computed_scores for 1.2 ARE complete (see 03_data_computed_scores.sql).
-- TODO: re-source % of adults with active mobile money for Kenya/Rwanda/
-- Tanzania (GSMA Mobile Money or national regulator data) and insert here.

-- 1.3 Smartphone Penetration
INSERT INTO raw_indicators
(country, dimension, si_code, si_name, raw_value, unit, data_type, year, source, source_url, data_quality)
VALUES
('Kenya', 'D1: Infrastructure Foundation', '1.3',
 'Smartphone Penetration', 42.0,
 '% of population with smartphone', 'quantitative', 2023,
 'GSMA Intelligence / DataReportal Digital 2024 Kenya',
 'https://datareportal.com', 'estimated'),

('Rwanda', 'D1: Infrastructure Foundation', '1.3',
 'Smartphone Penetration', 35.0,
 '% of population with smartphone', 'quantitative', 2023,
 'GSMA Intelligence estimated from Mobile Connectivity Index data',
 'https://mobileconnectivityindex.com', 'estimated'),

('Tanzania', 'D1: Infrastructure Foundation', '1.3',
 'Smartphone Penetration', 27.0,
 '% of population with smartphone', 'quantitative', 2023,
 'GSMA Intelligence estimated from Mobile Connectivity Index data and GNI proxy',
 'https://mobileconnectivityindex.com', 'estimated');

-- ── D2: State Capacity for Digital Governance ──────────────────────────

-- 2.1 E-Participation Index (supplementary data point behind the 2.1 score)
INSERT INTO raw_indicators
(country, dimension, si_code, si_name, raw_value, unit, data_type, year, source, source_url, data_quality)
VALUES
('Kenya', 'D2: State Capacity for Digital Governance', '2.1',
 'E-Participation Index (supplementary)', 0.5205,
 'E-Part Index (0-1)', 'quantitative', 2024,
 'UN e-Government Survey 2024',
 'https://publicadministration.un.org/egovkb', 'hard'),

('Rwanda', 'D2: State Capacity for Digital Governance', '2.1',
 'E-Participation Index (supplementary)', 0.7534,
 'E-Part Index (0-1)', 'quantitative', 2024,
 'UN e-Government Survey 2024',
 'https://publicadministration.un.org/egovkb', 'hard'),

('Tanzania', 'D2: State Capacity for Digital Governance', '2.1',
 'E-Participation Index (supplementary)', 0.2877,
 'E-Part Index (0-1)', 'quantitative', 2024,
 'UN e-Government Survey 2024',
 'https://publicadministration.un.org/egovkb', 'hard');

-- 2.2 Regulatory Maturity (documented enforcement actions)
INSERT INTO raw_indicators
(country, dimension, si_code, si_name, raw_value, unit, data_type, year, source, source_url, data_quality)
VALUES
('Kenya', 'D2: State Capacity for Digital Governance', '2.2',
 'Regulatory Maturity', 3,
 'documented enforcement actions', 'qualitative', 2023,
 'Kenya ODPC enforcement records',
 'https://www.odpc.go.ke', 'qualitative'),

('Rwanda', 'D2: State Capacity for Digital Governance', '2.2',
 'Regulatory Maturity', 4,
 'documented enforcement actions', 'qualitative', 2023,
 'Rwanda RURA data protection enforcement',
 'https://www.rura.rw', 'qualitative'),

('Tanzania', 'D2: State Capacity for Digital Governance', '2.2',
 'Regulatory Maturity', 0,
 'documented enforcement actions', 'qualitative', 2023,
 'Tanzania TCRA -- PDPA in force May 2023, no enforcement actions yet',
 'https://www.tcra.go.tz', 'qualitative');

-- 2.3 Government ICT Budget Percent
-- ⚠ GAP: original raw source rows for this indicator were not recovered.
-- computed_scores for 2.3 ARE complete (see 03_data_computed_scores.sql).
-- TODO: re-source ICT % of national budget for Kenya/Rwanda/Tanzania
-- (national Treasury/MoF budget statements) and insert here.

-- ── D3: Digital Public Stack Maturity ──────────────────────────────────

-- 3.1 National Digital ID Coverage
INSERT INTO raw_indicators
(country, dimension, si_code, si_name, raw_value, unit, data_type, year, source, source_url, data_quality)
VALUES
('Kenya', 'D3: Digital Public Stack Maturity', '3.1',
 'National Digital ID Coverage', 88.0,
 '% adults with national ID', 'quantitative', 2023,
 'Kenya ID coverage estimates / Maisha Namba rollout data',
 'https://www.immigration.go.ke', 'estimated'),

('Rwanda', 'D3: Digital Public Stack Maturity', '3.1',
 'National Digital ID Coverage', 92.0,
 '% adults 16+ enrolled in NPR', 'quantitative', 2023,
 'Rwanda NIDA / NPR coverage statistics',
 'https://www.nida.gov.rw', 'hard'),

('Tanzania', 'D3: Digital Public Stack Maturity', '3.1',
 'National Digital ID Coverage', 23.0,
 '% adults with physical NIDA card', 'quantitative', 2023,
 'Tanzania NIDA 2018-2020 data; ~80% additionally registered in database only, not card-issued',
 'https://www.nida.go.tz', 'estimated');

-- 3.2 Government Services Digitized
INSERT INTO raw_indicators
(country, dimension, si_code, si_name, raw_value, unit, data_type, year, source, source_url, data_quality)
VALUES
('Kenya', 'D3: Digital Public Stack Maturity', '3.2',
 'Government Services Digitized', 22000,
 'total services listed', 'quantitative', 2024,
 'Kenya eCitizen portal homepage',
 'https://www.ecitizen.go.ke', 'hard'),

('Rwanda', 'D3: Digital Public Stack Maturity', '3.2',
 'Government Services Digitized', 100,
 'estimated end-to-end services', 'quantitative', 2024,
 'IremboGov portal service directory, manual count across 20+ categories',
 'https://irembo.gov.rw', 'estimated'),

('Tanzania', 'D3: Digital Public Stack Maturity', '3.2',
 'Government Services Digitized', 0,
 'citizen-facing transactional services', 'quantitative', 2024,
 'Tanzania eGA portal; institutional services only, no citizen-facing transactions found',
 'https://www.ega.go.tz', 'hard');

-- 3.3 Payment Interoperability
-- ⚠ GAP: original raw source rows for this indicator were not recovered.
-- computed_scores for 3.3 ARE complete (see 03_data_computed_scores.sql).
-- TODO: re-source interoperability status (e.g. Tanzania TIPS / Rwanda
-- Mojaloop network transaction data) and insert here.

-- ── D4: Political Economy and Sustainability ───────────────────────────

-- 4.1 Domestic vs Donor Funding Ratio
INSERT INTO raw_indicators
(country, dimension, si_code, si_name, raw_value, unit, data_type, year, source, source_url, data_quality)
VALUES
('Kenya', 'D4: Political Economy and Sustainability', '4.1',
 'Domestic vs Donor Funding Ratio', 55.0,
 '% domestic-funded DPI (est.)', 'quantitative', 2023,
 'Kenya National Treasury / World Bank country fiscal data',
 'https://opentreasury.go.ke', 'estimated'),

('Rwanda', 'D4: Political Economy and Sustainability', '4.1',
 'Domestic vs Donor Funding Ratio', 45.0,
 '% domestic-funded DPI (est.)', 'quantitative', 2023,
 'Rwanda MINECOFIN / donor coordination data',
 'https://www.minecofin.gov.rw', 'estimated'),

('Tanzania', 'D4: Political Economy and Sustainability', '4.1',
 'Domestic vs Donor Funding Ratio', 30.0,
 '% domestic-funded DPI (est.)', 'quantitative', 2023,
 'Tanzania MoF / World Bank ODA data proxy',
 'https://www.mof.go.tz', 'estimated');

-- 4.2 Private Sector Co-Investment (1=none, 2=delivery contracts only, 3=risk-sharing)
INSERT INTO raw_indicators
(country, dimension, si_code, si_name, raw_value, unit, data_type, year, source, source_url, data_quality)
VALUES
('Kenya', 'D4: Political Economy and Sustainability', '4.2',
 'Private Sector Co-Investment', 3,
 'PPP level (1-3 scale)', 'qualitative', 2023,
 'Kenya PPP Authority / Safaricom M-Pesa infrastructure role',
 'https://www.ppp.go.ke', 'qualitative'),

('Rwanda', 'D4: Political Economy and Sustainability', '4.2',
 'Private Sector Co-Investment', 2,
 'PPP level (1-3 scale)', 'qualitative', 2023,
 'Rwanda Development Board PPP portfolio',
 'https://www.rdb.rw', 'qualitative'),

('Tanzania', 'D4: Political Economy and Sustainability', '4.2',
 'Private Sector Co-Investment', 1,
 'PPP level (1-3 scale)', 'qualitative', 2023,
 'Tanzania PPRA register; no digital infrastructure PPP found',
 'https://www.ppra.go.tz', 'qualitative');

-- 4.3 Political Commitment Durability (1=weak, 2=moderate, 3=strong multi-term)
INSERT INTO raw_indicators
(country, dimension, si_code, si_name, raw_value, unit, data_type, year, source, source_url, data_quality)
VALUES
('Kenya', 'D4: Political Economy and Sustainability', '4.3',
 'Political Commitment Durability', 2,
 'durability (1-3 scale)', 'qualitative', 2024,
 'Kenya Digital Master Plan 2022-2032',
 'https://ict.go.ke', 'qualitative'),

('Rwanda', 'D4: Political Economy and Sustainability', '4.3',
 'Political Commitment Durability', 3,
 'durability (1-3 scale)', 'qualitative', 2024,
 'Rwanda Vision 2050 and NST2',
 'https://www.minecofin.gov.rw', 'qualitative'),

('Tanzania', 'D4: Political Economy and Sustainability', '4.3',
 'Political Commitment Durability', 1,
 'durability (1-3 scale)', 'qualitative', 2024,
 'Tanzania Digital Economy Strategic Framework 2024-2034; too new to assess',
 'https://www.ict.go.tz', 'qualitative');
