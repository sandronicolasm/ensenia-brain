#!/bin/sh
# Corre radar.py con el Python 3 que haya (en Windows, `python3` suele ser un
# acceso directo de la tienda que no ejecuta nada). Sin Python 3, no hace nada.
DIR="$(cd "$(dirname "$0")" && pwd)"
for py in python3 python "py -3"; do
  if $py -c "import sys; sys.exit(0 if sys.version_info >= (3, 8) else 1)" >/dev/null 2>&1; then
    exec $py "$DIR/radar.py" "$@"
  fi
done
exit 0
