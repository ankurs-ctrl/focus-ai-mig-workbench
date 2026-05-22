Identify all attributes across STTM projects that use conditional transformation logic or calculated fields, and provide their source columns, data types, and associated project versions.


ALTER TABLE FFP_HDP_DLAB_DB_DEV.SCH_STTM_METADATA.TBL_SEMANTIC_BUNDLES
ADD COLUMN IF NOT EXISTS ANALYST_TOOL_NAME STRING;

kur.sinha\Desktop\bbi-workbench\bbi-workbench-latest-v1.2\bbi-mig-ai-workbench\start-ai-workbench-dev.ps1?
[D] Do not run  [R] Run once  [S] Suspend  [?] Help (default is "D"): R
Starting backend on http://127.0.0.1:8000
Starting frontend on http://127.0.0.1:3000

> focus-ai-migration@0.1.0 dev
> next dev --webpack


▲ Next.js 16.2.2 (webpack)
- Local:         http://localhost:3000
- Network:       http://10.40.0.28:3000
✓ Ready in 1383ms

○ Compiling / ...
 GET / 307 in 9.8s (next.js: 9.3s, application-code: 469ms)
○ Compiling /home ...
 GET /home 200 in 4.6s (next.js: 4.2s, application-code: 434ms)
[browser] Image with src "http://localhost:3000/images/focus/focus_home_logo.svg" has either width or height modified, but not the other. If you use CSS to change the size of your image, also include the styles 'width: "auto"' or 'height: "auto"' to maintain the aspect ratio.
 GET /dashboard 200 in 1475ms (next.js: 1424ms, application-code: 51ms)
○ Compiling /sttm/builder/new ...
 GET /sttm/builder/new 200 in 4.2s (next.js: 4.1s, application-code: 77ms)
⚠ ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-rule-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-rule-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-status-cell.tsx
Attempted import error: 'FocusChipCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusChipCell'). 

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-status-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx
Attempted import error: 'FocusChipCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusChipCell'). 

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx
Attempted import error: 'FocusChipCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusChipCell'). 

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/source-target-attribute-mapping.tsx
Attempted import error: 'FocusCheckboxCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusCheckboxCell').

Import trace for requested module:
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/source-target-attribute-mapping.tsx
Attempted import error: 'FocusInputCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusInputCell').

Import trace for requested module:
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/source-target-attribute-mapping.tsx
Attempted import error: 'FocusInputCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusInputCell').

Import trace for requested module:
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/source-target-attribute-mapping.tsx
Attempted import error: 'FocusInputCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusInputCell').

Import trace for requested module:
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-rule-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-rule-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-status-cell.tsx
Attempted import error: 'FocusChipCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusChipCell'). 

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-status-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx
Attempted import error: 'FocusChipCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusChipCell'). 

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx
Attempted import error: 'FocusChipCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusChipCell'). 

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-type-preview-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/source-target-attribute-mapping.tsx
Attempted import error: 'FocusCheckboxCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusCheckboxCell').

Import trace for requested module:
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/source-target-attribute-mapping.tsx
Attempted import error: 'FocusInputCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusInputCell').

Import trace for requested module:
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/source-target-attribute-mapping.tsx
Attempted import error: 'FocusInputCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusInputCell').

Import trace for requested module:
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx

./src/features/sttm/mapping/source-target-attribute-mapping.tsx
Attempted import error: 'FocusInputCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusInputCell').

Import trace for requested module:
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx
○ Compiling /sttm/builder/new/mapping ...
[browser] ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx
[browser] ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-rule-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx
[browser] ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx
[browser] ./src/features/sttm/mapping/cells/mapping-status-cell.tsx
Attempted import error: 'FocusChipCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusChipCell'). 

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-status-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx
[browser] ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').

Import trace for requested module:
./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx
./src/features/sttm/mapping/cells/index.ts
./src/features/sttm/mapping/source-target-attribute-mapping.tsx
./src/app/sttm/builder/new/mapping/page.tsx
[browser] There were more warnings in other files.
You can find a complete log in the terminal.
 GET /sttm/builder/new/mapping 200 in 3.1s (next.js: 3.0s, application-code: 95ms)
[browser] Uncaught Error: Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: undefined. You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.

Check the render method of `SourceTargetAttributeMapping`.
    at MappingPage (src\app\sttm\builder\new\mapping\page.tsx:583:13)
  581 |         {activeTab === 'mapping' ? (
  582 |           <div className="min-w-0 flex-1 overflow-hidden">
> 583 |             <SourceTargetAttributeMapping />
      |             ^
  584 |           </div>
  585 |         ) : null}
  586 |
 GET /sttm/builder/new/mapping 200 in 560ms (next.js: 5ms, application-code: 555ms)
[browser] ./src/features/sttm/mapping/cells/mapping-row-index-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').
[browser] ./src/features/sttm/mapping/cells/mapping-rule-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').
[browser] ./src/features/sttm/mapping/cells/mapping-source-columns-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').
[browser] ./src/features/sttm/mapping/cells/mapping-status-cell.tsx
Attempted import error: 'FocusChipCell' is not exported from '@/components/ui/focus-table' (imported as 'FocusChipCell'). 
[browser] ./src/features/sttm/mapping/cells/mapping-target-column-cell.tsx
Attempted import error: 'focusTableCellSx' is not exported from '@/components/ui/focus-table' (imported as 'focusTableCellSx').
[browser] There were more warnings in other files.
You can find a complete log in the terminal.
 GET /sttm/builder/new 200 in 82ms (next.js: 43ms, application-code: 39ms)
[browser] Image with src "http://localhost:3000/images/focus/focus_home_logo.svg" has either width or height modified, but not the other. If you use CSS to change the size of your image, also include the styles 'width: "auto"' or 'height: "auto"' to maintain the aspect ratio.
 GET /sttm/builder/new/mapping 200 in 33ms (next.js: 5ms, application-code: 28ms)
[browser] Uncaught Error: Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: undefined. You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.

Check the render method of `SourceTargetAttributeMapping`.
