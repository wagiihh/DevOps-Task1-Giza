#!/bin/bash

#Assignment 1 

if [ "$EUID" -ne 0 ]; then
echo "Run the Script as root to be able to complete the user completion process"
exit 1
fi

#CREATING THE USER
read -p "ENTER THE USERNAME: " x

USER_NAME="$x"
if id "$USER_NAME" &>/dev/null;then
echo "USER '$USER_NAME'  ALREADY EXISTS"
else
useradd -m -s /bin/bash "$USER_NAME"
echo "USER: '$USER_NAME' CREATED SUCCESSFULLY"
fi
JDK_VERSION=21
JDK_URL="https://download.oracle.com/java/21/latest/jdk-21_linux-aarch64_bin.tar.gz"
#SWITCH TO THE NEW CREATED USER
sudo -u "$USER_NAME" -H env JDK_VERSION="$JDK_VERSION" JDK_URL="$JDK_URL" bash <<'EOF'
set -e

JAVA_DIR="$HOME/java"
BASHRC="$HOME/.bashrc"
MARKER="# >>> Java JDK ${JDK_VERSION} setup >>>"

mkdir -p "$JAVA_DIR"
cd "$JAVA_DIR"

#CHECK IF JDK IS INSTALLED
if grep -q "$MARKER" "$BASHRC" 2>/dev/null; then
  echo "JDK ${JDK_VERSION} is already installed - SKIPPING"
  exit 0
fi

rm -rf "$JAVA_DIR"/jdk* "$JAVA_DIR"/*.tar.gz 2>/dev/null || true

echo "Downloading Open JDK ${JDK_VERSION} ...."
curl -fL -o "$JAVA_DIR/jdk.tar.gz" "$JDK_URL"

echo "Extracting JDK..."
tar -xzf "$JAVA_DIR/jdk.tar.gz"
rm "$JAVA_DIR/jdk.tar.gz"

# Find the extracted JDK directory (first match like ~/java/jdk-21.*)
JDK_DIR=$(find "$JAVA_DIR" -maxdepth 1 -type d -name "jdk*" | head -n 1)

if [ -z "$JDK_DIR" ]; then
  echo "Failed to locate extracted JDK directory"
  exit 1
fi

echo "FOUND JDK DIR: $JDK_DIR"

touch "$BASHRC"
{
  echo ""
  echo "$MARKER"
  echo "export JAVA_HOME=\"$JDK_DIR\""
  echo 'export PATH="$JAVA_HOME/bin:$PATH"'
  echo "# <<< Java JDK ${JDK_VERSION} setup <<<"
} >> "$BASHRC"

# Also export for the current shell so you can use java right away
export JAVA_HOME="$JDK_DIR"
export PATH="$JAVA_HOME/bin:$PATH"

# Quick sanity check
echo "JAVA_HOME=$JAVA_HOME"
java -version
EOF

