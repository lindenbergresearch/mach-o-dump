#
# mach-o dump install script
#
# (C)2020 by Patrick Lindenberg / Lindenberg Research
#
USER=$(whoami)
SOURCE=$1
TARGET=$2

if [ "$USER" == "root" ]; then
  echo "installing mach-o dump as root:"
else
  echo "error: installation of mach-o dump must be run as root."
  echo "try: 'sudo make install'"
  exit 1
fi

if [ ! -x "$SOURCE" ]; then
  echo "error: no executable source found: $SOURCE"
  exit 2
fi

mkdir -p "$TARGET"

if [ ! -d "$TARGET" ]; then
  echo "error: unable to locate target directory: $TARGET"
  exit 3
fi

cp -f "$SOURCE" "$TARGET"

FILENAME=$(basename "$SOURCE")
FULL_TARGET=$TARGET/$FILENAME

if [ ! -x "$FULL_TARGET" ]; then
  echo "error: unable to install $SOURCE to $TARGET"
  exit 4
else
  echo "mach-o dump has been successfully installed."
fi
