#!/bin/bash

(
echo "Bash nesting level: $BASH_SUBSHELL. Shell PID: $BASHPID"
(
echo "Bash nesting level: $BASH_SUBSHELL. Shell PID: $BASHPID"
(
echo "Bash nesting level: $BASH_SUBSHELL. Shell PID: $BASHPID"
)
)
)
