# Data Sources

All primary sourcing is documented inline in `database/02_data_raw_indicators.sql` (source name, URL, and a `data_quality` flag of hard/estimated/qualitative per row). Summary by sub-indicator:

| Source | Sub-Indicators |
|---|---|
| UN e-Government Survey 2024 | 2.1 E-Government Development Index |
| GSMA Mobile Connectivity Index 2025 | 1.1 Mobile Internet Penetration |
| Communications Authority Kenya / FinAccess 2024 | 1.2 Mobile Money Penetration (Kenya) |
| GSMA Intelligence / DataReportal 2024 | 1.3 Smartphone Penetration |
| World Bank ID4D Database | 3.1 National Digital ID Coverage |
| IremboGov / eCitizen / eGA portals (manual count) | 3.2 Government Services Digitized |
| Rwanda NIDA / Kenya ODPC / Tanzania TCRA | 2.2 Regulatory Maturity |
| Rwanda MINECOFIN / Kenya Treasury / Tanzania MoF | 2.3 Government ICT Budget Percent |
| Rwanda BNR / Kenya CBK / Tanzania BOT | 3.3 Payment Interoperability |
| World Bank ODA data / national budget documents | 4.1 Domestic vs Donor Funding Ratio |
| Rwanda RDB / Kenya PPP Authority / Tanzania PPRA | 4.2 Private Sector Co-Investment |
| National strategy documents (Rwanda Vision 2050, Kenya Digital Master Plan 2022-2032, Tanzania DESF 2024-2034) | 4.3 Political Commitment Durability |

## Known gap: three sub-indicators have complete scores but missing raw source rows

`02_data_raw_indicators.sql` is missing the original sourced rows for:
- **1.2 Mobile Money Penetration**
- **2.3 Government ICT Budget Percent**
- **3.3 Payment Interoperability**

The `computed_scores` used throughout the analysis (and in the policy brief) for these three sub-indicators are complete for all three countries — only the underlying raw-value citation rows were not recovered when this repo was assembled. Each gap is flagged with a `TODO` comment at the relevant point in `02_data_raw_indicators.sql`. Before treating this project as fully reproducible from raw sources, re-source and insert:
- % of adults with active mobile money (GSMA Mobile Money or national regulator data) for Kenya/Rwanda/Tanzania
- ICT % of national budget (national Treasury/MoF budget statements) for all three countries
- Payment interoperability status (e.g. Tanzania TIPS / Rwanda Mojaloop transaction data) for all three countries

## Data integrity note

An earlier composite calculation (used in a draft of the policy brief) omitted sub-indicator 3.1 (National Digital ID Coverage) for Kenya and Rwanda while correctly including it for Tanzania, understating both countries' composite capability scores — most significantly Rwanda's, since 3.1 is one of its strongest indicators (capability score of 9). This was caught by cross-checking the brief's headline numbers against a fresh calculation from `database/03_data_computed_scores.sql`, and corrected in the current version of the brief and in `scoring/composite_index.csv`. See `scoring/` for the verified query outputs.
