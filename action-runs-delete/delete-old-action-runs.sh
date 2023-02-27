#!/bin/bash

# authentication is done with token

export OWNER=".."
export REPOSITORY=".."

gh api -X GET /repos/$OWNER/$REPOSITORY/actions/runs --paginate \
  | jq '.workflow_runs[] | select( .created_at < "2022-10" ) | .id' \
  | xargs -t -I{} gh api -X DELETE /repos/$OWNER/$REPOSITORY/actions/runs/{}
