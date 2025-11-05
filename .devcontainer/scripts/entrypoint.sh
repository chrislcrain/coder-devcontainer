#!/bin/bash
if [ -d /workspace ]; then
  cd /workspace
else
  cd /home/coder
fi
exec "$@"
