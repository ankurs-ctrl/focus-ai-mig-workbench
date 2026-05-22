Identify all attributes across STTM projects that use conditional transformation logic or calculated fields, and provide their source columns, data types, and associated project versions.


ALTER TABLE FFP_HDP_DLAB_DB_DEV.SCH_STTM_METADATA.TBL_SEMANTIC_BUNDLES
ADD COLUMN IF NOT EXISTS ANALYST_TOOL_NAME STRING;

./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx:2:1
Export focusTableCellSx doesn't exist in target module
  1 | import { TableCell, Typography } from '@mui/material';
> 2 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  3 |
  4 | type MappingRowIndexCellProps = {
  5 |   index: number;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx:6:1
Export focusTableCellSx doesn't exist in target module
  4 | import { FocusSelect } from '@/components/ui/focus-select';
  5 | import { FocusButton } from '@/components/ui/focus-button';
> 6 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  7 |
  8 | type MappingRuleCellProps = {
  9 |   value: string;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx:6:1
Export focusTableCellSx doesn't exist in target module
  4 | import { FocusSelect } from '@/components/ui/focus-select';
  5 | import { FocusButton } from '@/components/ui/focus-button';
> 6 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  7 |
  8 | type MappingRuleCellProps = {
  9 |   value: string;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx:3:1
Export focusTableCellSx doesn't exist in target module
  1 | import { Box, TableCell, Tooltip, Typography } from '@mui/material';
  2 | import InfoOutlinedIcon from '@mui/icons-material/InfoOutlined';
> 3 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  4 | import { FocusAutocomplete } from '@/components/ui/focus-auto-complete';
  5 | import type { FocusAutocompleteOption } from '@/components/ui/focus-auto-complete';
  6 |

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx:3:1
Export focusTableCellSx doesn't exist in target module
  1 | import { Box, TableCell, Tooltip, Typography } from '@mui/material';
  2 | import InfoOutlinedIcon from '@mui/icons-material/InfoOutlined';
> 3 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  4 | import { FocusAutocomplete } from '@/components/ui/focus-auto-complete';
  5 | import type { FocusAutocompleteOption } from '@/components/ui/focus-auto-complete';
  6 |

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx:2:1
Export focusTableCellSx doesn't exist in target module
  1 | import { Box, TableCell, Typography } from '@mui/material';
> 2 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  3 |
  4 | type MappingTargetColumnCellProps = {
  5 |   name: string;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx:2:1
Export focusTableCellSx doesn't exist in target module
  1 | import { Box, TableCell, Typography } from '@mui/material';
> 2 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  3 |
  4 | type MappingTargetColumnCellProps = {
  5 |   name: string;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/source-target-attribute-mapping.tsx:33:1
Export FocusCheckboxCell doesn't exist in target module
  31 | } from './mapping-utils';
  32 | import { FocusCheckbox } from '@/components/ui/focus-checkbox';
> 33 | import { FocusCheckboxCell, FocusInputCell } from '@/components/ui/focus-table';
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  34 | import {
  35 |   MappingRowIndexCell,
  36 |   MappingRuleCell,

The export FocusCheckboxCell was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/source-target-attribute-mapping.tsx:33:1
Export FocusCheckboxCell doesn't exist in target module
  31 | } from './mapping-utils';
  32 | import { FocusCheckbox } from '@/components/ui/focus-checkbox';
> 33 | import { FocusCheckboxCell, FocusInputCell } from '@/components/ui/focus-table';
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  34 | import {
  35 |   MappingRowIndexCell,
  36 |   MappingRuleCell,

The export FocusCheckboxCell was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).  
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-status-cell.tsx:1:1
Export FocusChipCell doesn't exist in target module
> 1 | import { FocusChipCell } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  2 | import type { MappingStatus } from '@/features/sttm/types/sttm.types';
  3 |
  4 | type MappingStatusCellProps = {

The export FocusChipCell was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-status-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-status-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-status-cell.tsx:1:1
Export FocusChipCell doesn't exist in target module
> 1 | import { FocusChipCell } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  2 | import type { MappingStatus } from '@/features/sttm/types/sttm.types';
  3 |
  4 | type MappingStatusCellProps = {

The export FocusChipCell was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).      
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-status-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-status-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx:1:1
Export FocusChipCell doesn't exist in target module
> 1 | import { FocusChipCell } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  2 | import { formatSqlType, typeChipSx } from '../mapping-utils';
  3 |
  4 | type MappingTypePreviewCellProps = {

The export FocusChipCell was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx:1:1
Export FocusChipCell doesn't exist in target module
> 1 | import { FocusChipCell } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  2 | import { formatSqlType, typeChipSx } from '../mapping-utils';
  3 |
  4 | type MappingTypePreviewCellProps = {

The export FocusChipCell was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).      
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/source-target-attribute-mapping.tsx:33:1
Export FocusInputCell doesn't exist in target module
  31 | } from './mapping-utils';
  32 | import { FocusCheckbox } from '@/components/ui/focus-checkbox';
> 33 | import { FocusCheckboxCell, FocusInputCell } from '@/components/ui/focus-table';
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  34 | import {
  35 |   MappingRowIndexCell,
  36 |   MappingRuleCell,

The export FocusInputCell was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).  
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/source-target-attribute-mapping.tsx:33:1
Export FocusInputCell doesn't exist in target module
  31 | } from './mapping-utils';
  32 | import { FocusCheckbox } from '@/components/ui/focus-checkbox';
> 33 | import { FocusCheckboxCell, FocusInputCell } from '@/components/ui/focus-table';
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  34 | import {
  35 |   MappingRowIndexCell,
  36 |   MappingRuleCell,

The export FocusInputCell was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).     
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx:2:1
Export focusTableCellSx doesn't exist in target module
  1 | import { TableCell, Typography } from '@mui/material';
> 2 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  3 |
  4 | type MappingRowIndexCellProps = {
  5 |   index: number;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx:2:1
Export focusTableCellSx doesn't exist in target module
  1 | import { TableCell, Typography } from '@mui/material';
> 2 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  3 |
  4 | type MappingRowIndexCellProps = {
  5 |   index: number;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx:6:1
Export focusTableCellSx doesn't exist in target module
  4 | import { FocusSelect } from '@/components/ui/focus-select';
  5 | import { FocusButton } from '@/components/ui/focus-button';
> 6 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  7 |
  8 | type MappingRuleCellProps = {
  9 |   value: string;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx:6:1
Export focusTableCellSx doesn't exist in target module
  4 | import { FocusSelect } from '@/components/ui/focus-select';
  5 | import { FocusButton } from '@/components/ui/focus-button';
> 6 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  7 |
  8 | type MappingRuleCellProps = {
  9 |   value: string;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx:3:1
Export focusTableCellSx doesn't exist in target module
  1 | import { Box, TableCell, Tooltip, Typography } from '@mui/material';
  2 | import InfoOutlinedIcon from '@mui/icons-material/InfoOutlined';
> 3 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  4 | import { FocusAutocomplete } from '@/components/ui/focus-auto-complete';
  5 | import type { FocusAutocompleteOption } from '@/components/ui/focus-auto-complete';
  6 |

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx:3:1
Export focusTableCellSx doesn't exist in target module
  1 | import { Box, TableCell, Tooltip, Typography } from '@mui/material';
  2 | import InfoOutlinedIcon from '@mui/icons-material/InfoOutlined';
> 3 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  4 | import { FocusAutocomplete } from '@/components/ui/focus-auto-complete';
  5 | import type { FocusAutocompleteOption } from '@/components/ui/focus-auto-complete';
  6 |

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx:2:1
Export focusTableCellSx doesn't exist in target module
  1 | import { Box, TableCell, Typography } from '@mui/material';
> 2 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  3 |
  4 | type MappingTargetColumnCellProps = {
  5 |   name: string;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx:2:1
Export focusTableCellSx doesn't exist in target module
  1 | import { Box, TableCell, Typography } from '@mui/material';
> 2 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  3 |
  4 | type MappingTargetColumnCellProps = {
  5 |   name: string;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/source-target-attribute-mapping.tsx:33:1
Export FocusCheckboxCell doesn't exist in target module
  31 | } from './mapping-utils';
  32 | import { FocusCheckbox } from '@/components/ui/focus-checkbox';
> 33 | import { FocusCheckboxCell, FocusInputCell } from '@/components/ui/focus-table';
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  34 | import {
  35 |   MappingRowIndexCell,
  36 |   MappingRuleCell,

The export FocusCheckboxCell was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/source-target-attribute-mapping.tsx:33:1
Export FocusCheckboxCell doesn't exist in target module
  31 | } from './mapping-utils';
  32 | import { FocusCheckbox } from '@/components/ui/focus-checkbox';
> 33 | import { FocusCheckboxCell, FocusInputCell } from '@/components/ui/focus-table';
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  34 | import {
  35 |   MappingRowIndexCell,
  36 |   MappingRuleCell,

The export FocusCheckboxCell was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).  
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-status-cell.tsx:1:1
Export FocusChipCell doesn't exist in target module
> 1 | import { FocusChipCell } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  2 | import type { MappingStatus } from '@/features/sttm/types/sttm.types';
  3 |
  4 | type MappingStatusCellProps = {

The export FocusChipCell was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-status-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-status-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-status-cell.tsx:1:1
Export FocusChipCell doesn't exist in target module
> 1 | import { FocusChipCell } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  2 | import type { MappingStatus } from '@/features/sttm/types/sttm.types';
  3 |
  4 | type MappingStatusCellProps = {

The export FocusChipCell was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).      
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-status-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-status-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx:1:1
Export FocusChipCell doesn't exist in target module
> 1 | import { FocusChipCell } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  2 | import { formatSqlType, typeChipSx } from '../mapping-utils';
  3 |
  4 | type MappingTypePreviewCellProps = {

The export FocusChipCell was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx:1:1
Export FocusChipCell doesn't exist in target module
> 1 | import { FocusChipCell } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  2 | import { formatSqlType, typeChipSx } from '../mapping-utils';
  3 |
  4 | type MappingTypePreviewCellProps = {

The export FocusChipCell was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).      
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/source-target-attribute-mapping.tsx:33:1
Export FocusInputCell doesn't exist in target module
  31 | } from './mapping-utils';
  32 | import { FocusCheckbox } from '@/components/ui/focus-checkbox';
> 33 | import { FocusCheckboxCell, FocusInputCell } from '@/components/ui/focus-table';
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  34 | import {
  35 |   MappingRowIndexCell,
  36 |   MappingRuleCell,

The export FocusInputCell was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).  
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/source-target-attribute-mapping.tsx:33:1
Export FocusInputCell doesn't exist in target module
  31 | } from './mapping-utils';
  32 | import { FocusCheckbox } from '@/components/ui/focus-checkbox';
> 33 | import { FocusCheckboxCell, FocusInputCell } from '@/components/ui/focus-table';
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  34 | import {
  35 |   MappingRowIndexCell,
  36 |   MappingRuleCell,

The export FocusInputCell was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).     
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx:2:1
Export focusTableCellSx doesn't exist in target module
  1 | import { TableCell, Typography } from '@mui/material';
> 2 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  3 |
  4 | type MappingRowIndexCellProps = {
  5 |   index: number;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx:2:1
Export focusTableCellSx doesn't exist in target module
  1 | import { TableCell, Typography } from '@mui/material';
> 2 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  3 |
  4 | type MappingRowIndexCellProps = {
  5 |   index: number;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx:6:1
Export focusTableCellSx doesn't exist in target module
  4 | import { FocusSelect } from '@/components/ui/focus-select';
  5 | import { FocusButton } from '@/components/ui/focus-button';
> 6 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  7 |
  8 | type MappingRuleCellProps = {
  9 |   value: string;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx:6:1
Export focusTableCellSx doesn't exist in target module
  4 | import { FocusSelect } from '@/components/ui/focus-select';
  5 | import { FocusButton } from '@/components/ui/focus-button';
> 6 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  7 |
  8 | type MappingRuleCellProps = {
  9 |   value: string;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx:3:1
Export focusTableCellSx doesn't exist in target module
  1 | import { Box, TableCell, Tooltip, Typography } from '@mui/material';
  2 | import InfoOutlinedIcon from '@mui/icons-material/InfoOutlined';
> 3 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  4 | import { FocusAutocomplete } from '@/components/ui/focus-auto-complete';
  5 | import type { FocusAutocompleteOption } from '@/components/ui/focus-auto-complete';
  6 |

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx:3:1
Export focusTableCellSx doesn't exist in target module
  1 | import { Box, TableCell, Tooltip, Typography } from '@mui/material';
  2 | import InfoOutlinedIcon from '@mui/icons-material/InfoOutlined';
> 3 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  4 | import { FocusAutocomplete } from '@/components/ui/focus-auto-complete';
  5 | import type { FocusAutocompleteOption } from '@/components/ui/focus-auto-complete';
  6 |

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx:2:1
Export focusTableCellSx doesn't exist in target module
  1 | import { Box, TableCell, Typography } from '@mui/material';
> 2 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  3 |
  4 | type MappingTargetColumnCellProps = {
  5 |   name: string;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-client] (ecmascript).
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
[browser] ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx:2:1
Export focusTableCellSx doesn't exist in target module
  1 | import { Box, TableCell, Typography } from '@mui/material';
> 2 | import { focusTableCellSx } from '@/components/ui/focus-table';
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  3 |
  4 | type MappingTargetColumnCellProps = {
  5 |   name: string;

The export focusTableCellSx was not found in module [project]/src/components/ui/focus-table.tsx [app-ssr] (ecmascript).   
Did you mean to import FocusTable?
All exports of the module are statically known (It doesn't have dynamic exports). So it's known statically that the requested export doesn't exist.

Import traces:
  Client Component Browser:
    ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx [Client Component Browser]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component Browser]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]

  Client Component SSR:
    ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx [Client Component SSR]
    ./src/features/sttm/mapping/source-target-attribute-mapping.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Client Component SSR]
    ./src/app/sttm/builder/new/mapping/page.tsx [Server Component]
