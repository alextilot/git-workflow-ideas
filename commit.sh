#!/bin/bash

# Extract the ticket number from the branch name and prepend it in the commit message.
# This script will run in the git hook prepare-commit-msg.

BRANCH=$(git rev-parse --abbrev-ref HEAD)
MESSAGE_FILE=$1
MESSAGE=$(cat $MESSAGE_FILE)
TICKET=$(echo $BRANCH | grep -Eo '^(\w+/)?(\w+[-_])?[0-9]+' | grep -Eo '(\w+[-])?[0-9]+' | tr "[:lower:]" "[:upper:]")

echo "${BRANCH}"

if [[ $BRANCH == 'HEAD' ]]; then
  # Currently in rebasing state, so do nothing
  exit 0
fi

if [[ "${MESSAGE}" = "Merge branch "* ]]; then
  # Pulling the merge commit should not be prepend with ticket number
  exit 0
fi

if [[ -z $TICKET ]]; then
  echo "You are not providing a valid branch name with ticket number."
  echo "Please follow this format '<type>/<ticket-###>/<title>'."
  exit 1
fi

if [[ "${MESSAGE}" = "${TICKET}: "* ]]; then
  # If start with ABC-123: abc, delete it! With colon.
  MESSAGE=$(echo ${MESSAGE} | sed "s/^${TICKET}: //")

elif [[ "${MESSAGE}" = "${TICKET} "* ]]; then
  # If start with ABC-123 abc, delete it! Without colon.
  MESSAGE=$(echo ${MESSAGE} | sed "s/^${TICKET} //")

elif [[ "${MESSAGE}" = "[${TICKET}]"* ]]; then
  # Already well formatted then do nothing
  exit 0
fi

# Prepend the ticket number in the message
MESSAGE="[${TICKET}] ${MESSAGE}"
echo $MESSAGE >$MESSAGE_FILE
exit 0
