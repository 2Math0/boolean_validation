#!/bin/bash

MERMAID_FILE="mermaid/simplified_arch.mmd"
TEMP_FILE="TEMP_MERMAID.md"
README_FILE="README.md"

# Step 1: Wrap .mmd contents in a mermaid code block, ensuring closing ``` is on its own line
{
  echo '```mermaid'
  cat "$MERMAID_FILE"
  echo
  echo '```'
} > "$TEMP_FILE"

# Step 2: Replace content between markers
awk -v mermaid="$TEMP_FILE" '
  BEGIN {in_block=0}
  /<!--MERMAID_START-->/ {print; system("cat " mermaid); in_block=1; next}
  /<!--MERMAID_END-->/ {in_block=0}
  !in_block
' "$README_FILE" > README_TEMP.md && mv README_TEMP.md "$README_FILE"

# Step 3: Cleanup
rm "$TEMP_FILE"