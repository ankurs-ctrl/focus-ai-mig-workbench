A browser window should have opened for you to complete the login. If you can't see it, check existing browser windows, or your OS settings.
Snowflake connection established.
Loading project 4.
Storing historical asset: 01-EverNest-HHs.sql
Resolving source and target tables for: 01-EverNest-HHs.sql
Running FIR phase: collect_feedback
Running FIR phase: enrich_context
Running FIR phase: invoke_agent
Running FIR phase: score_recommendations
{
  "project_id": "4",
  "project_name": "EverNest Redtail CRM Migration",
  "notes_loaded": 0,
  "assets_loaded": 1,
  "search_rebuilt": false,
  "fir_processed_now": true,
  "fir_processing": {
    "collect_feedback": {
      "collected_by_source": {
        "conversation": 0,
        "document_upload": 2,
        "explicit": 3,
        "implicit_derived": 0,
        "implicit_semantic": 0,
        "mapping_feedback": 0,
        "publish": 0,
        "recommendation_outcomes": 8,
        "ui_events": 30
      },
      "errors": [
        "mapping_feedback: (1304): 01c5c0ff-0004-ce0d-0001-70b2495567ce: 002086 (22000): 01c5c0ff-0004-ce0d-0001-70b2495567ce: SQL compilation error:\nInvalid bind value (['1', '101']) for type (FIXED).",
        "semantic_feedback: (1304): 01c5c0ff-0004-ce0d-0001-70b2495567de: 000904 (42000): 01c5c0ff-0004-ce0d-0001-70b2495567de: SQL compilation error: error line 8 at position 16\ninvalid identifier 'SEMANTIC_LEVEL'",
        "publish_feedback: (1304): 01c5c0ff-0004-ce0d-0001-70b2495567ea: 002086 (22000): 01c5c0ff-0004-ce0d-0001-70b2495567ea: SQL compilation error:\nInvalid bind value (['2', '301']) for type (FIXED).",
        "ui_events: list index out of range"
      ],
      "processed_at": "2026-07-16T20:15:05.636434",
      "status": "success",
      "total_collected": 43
    },
    "enrich_context": {
      "enriched_count": 19,
      "failures": [],
      "pending_count": 19,
      "processed_at": "2026-07-16T20:21:00.080508",
      "status": "success"
    },
    "invoke_agent": {
      "agent_invoked": true,
      "agent_response": null,
      "context_built": {
        "activity_summary": {
          "active_recommendations": 17,
          "last_24h_by_source": {
            "document_upload": 4,
            "explicit": 14,
            "implicit": 8,
            "mapping_feedback": 20
          }
        },
        "pending_counts": {
          "pending": 26
        },
        "streams_with_data": [
          "STM_FIR_WORKBENCH_FEEDBACK",
          "STM_FIR_STTM_ATTRIBUTES",
          "STM_FIR_STTM_VERSIONS",
          "STM_FIR_CLIENT_SQL_ASSETS"
        ],
        "unprocessed_document_count": 0
      },
      "errors": [
        "Expecting value: line 1 column 1 (char 0)"
      ],
      "started_at": "2026-07-16T20:21:04.533717",
      "status": "failed"
    },
    "score_recommendations": {
      "recommendations_scored": 21,
      "recommendations_with_outcomes": 0,
      "scored_at": "2026-07-16 15:41:19.896 -0500",
      "status": "success"
    }
  },
  "dry_run": false,
  "assets": [
    {
      "asset_id": "3abf76268adb34d1cb6caf9388e572de",
      "file": "C:\\Users\\ankur.sinha\\Desktop\\bbi-workbench-dev\\ffp_ai_mig_workbench\\01-EverNest-HHs.sql",
      "project_id": "4",
      "mode": "learn_from_it",
      "detected_sources": [
        "FFP_HDP_CRM_MIG_DB_DEV.SCH_OPS.COUNTRY_CODES",
        "FFP_HDP_CRM_MIG_DB_DEV.SCH_OPS.STATE_CODES",
        "CONTACTS",
        "CONTACT_STATUSES",
        "CONTACT_FAMILY_MEMBERS",
        "CONTACT_FAMILIES",
        "SERVICING_ADVISORS",
        "WRITING_ADVISORS",
        "sources",
        "CONTACT_PERSONAL_PROFILES",
        "CONTACT_CATEGORIES",
        "ADDRESSES",
        "contacts",
        "contact_family_members",
        "CONTACT_UDFs",
        "CONTACT_UDF_FIELDS"
      ],
      "detected_targets": [],
      "detected_ctes": [
        "UserMaster",
        "ContactMaster",
        "HHMaster",
        "OppMaster",
        "ACRMaster",
        "BizAcctMaster",
        "LeadMaster",
        "ReferralMaster",
        "SOURCE",
        "BillingAddress",
        "FamilyHOH",
        "PrefContactMethod",
        "Drinks",
        "PetName",
        "ContactMadeAwareofFocus",
        "AllTaxIDsHaveClientContactRecord",
        "SIGNEDAdvisoryAgreement",
        "FocusLanguageInvestmentAgreement"
      ],
      "resolved_references": [
        {
          "reference_id": "asset_ref_e29beee036904feb8830",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACTS",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_a2d1917fdb754ef2bda1",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.ADDRESSES",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_dbaab4b3e73945b58ae7",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_FAMILIES",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_bc4a63f7f88a4976af0e",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_FAMILY_MEMBERS",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_adc365eeb4ae4f00b111",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_STATUSES",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_a7511b22745f4e7790e4",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_PERSONAL_PROFILES",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_366dc3d1fef1423991af",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_CATEGORIES",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_4269664c37084e51acb2",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_UDFS",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_0b749b3b057e480c81c6",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_UDF_FIELDS",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_8f1cceebee814ed9abdf",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.SERVICING_ADVISORS",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_852b2e0d5b354dfa972e",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.WRITING_ADVISORS",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_c1db0bd17c2e431a83ca",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.SOURCES",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_7c51172f2e9c47ac9344",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.MAPPER_HH_MASTER",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_389862a03bc34bd7aa21",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.MAPPER_REFERRAL_MASTER",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_bd4a59512aa44cb5856d",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.MAPPER_USER",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_df52e427480846e4808f",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.COUNTRY_CODES",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_e6cbc014bdca46aa906e",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.STATE_CODES",
          "reference_role": "source",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        },
        {
          "reference_id": "asset_ref_0849798bf0ad404bbcab",
          "raw_identifier": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_TARGET.EVERNEST_HH_SF_IMPORT",
          "reference_role": "target",
          "resolution_status": "unresolved",
          "resolved_fqn": null,
          "candidate_fqns": [],
          "semantic_table_view_id": null,
          "semantic_status": "missing",
          "resolution_method": "exact_fqn",
          "resolution_confidence": 0.0
        }
      ],
      "status": "queued_for_fir"
    }
  ],
  "mapping": {
    "sttm_id": "401",
    "mapping_name": "EVERNEST_HH_SF_IMPORT Historical Mapping",
    "source_tables": [
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.ADDRESSES",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACTS",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_CATEGORIES",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_FAMILIES",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_FAMILY_MEMBERS",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_PERSONAL_PROFILES",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_STATUSES",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_UDFS",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.CONTACT_UDF_FIELDS",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.COUNTRY_CODES",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.MAPPER_HH_MASTER",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.MAPPER_REFERRAL_MASTER",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.MAPPER_USER",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.SERVICING_ADVISORS",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.SOURCES",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.STATE_CODES",
      "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_SOURCE.WRITING_ADVISORS"
    ],
    "target_table": "FFP_HDP_DLAB_DB_DEV.SCH_EVERNEST_HH_TARGET.EVERNEST_HH_SF_IMPORT",
    "mapping_row_count": 32,
    "snapshot_id": "snapshot_46d1078ba6534882a2cf",
    "context_key": "ctx_003c4873ac994cc841c88307f02ce73b869f1a75",
    "derived_sources": [],
    "published": true,
    "version_number": 1
  }
}
PS C:\Users\ankur.sinha\Desktop\bbi-workbench-dev\ffp_ai_mig_workbench> 
