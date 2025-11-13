# 📙 **Script Manual --- Logic Breakdown ***

## 🔐 **1. Permission Check**

``` bash
if [ "$EUID" -ne 0 ]; then
  echo "Run as root" ; exit 1
fi
```

Ensures the script is executed as root to safely create users and
configure environments.

## 👤 **2. User Creation**

``` bash
useradd -m -s /bin/bash "$USER_NAME"
```

Creates the target user if they don't exist, ensuring they have a valid
home directory and shell.

## ☕ **3. JDK Setup Variables**

``` bash
JDK_VERSION=21
JDK_URL="https://download.oracle.com/java/21/latest/jdk-21_linux-aarch64_bin.tar.gz"
```

Centralized metadata for easier updates.

## 👥 **4. Running as the Target User**

``` bash
sudo -u "$USER_NAME" env JDK_VERSION="$JDK_VERSION" JDK_URL="$JDK_URL" bash <<'EOF'
```

Ensures JDK is installed under the user's home with correct ownership.

## 📦 **5. JDK Download & Extraction**

``` bash
mkdir -p ~/java && cd ~/java
curl -fL -o jdk.tar.gz "$JDK_URL"
tar -xzf jdk.tar.gz && rm jdk.tar.gz
```

Downloads and Extracts the JDK cleanly.

## 🔍 **6. Auto‑Detect JDK Directory**

``` bash
JDK_DIR=$(find ~/java -maxdepth 1 -type d -name "jdk*" | head -n 1)
```

Dynamic detection prevents hardcoding folder names.

## 🔧 **7. Environment Configuration**

``` bash
export JAVA_HOME=$JDK_DIR
export PATH="$JAVA_HOME/bin:$PATH"
```

Appended to `.bashrc` for persistent configuration.

## 🧪 **8. Validation**

``` bash
java -version
```

Confirms successful installation.

------------------------------------------------------------------------

# 📝 **Summary Diagram**

    ┌───────────────────────────┐
    │ 1. Check root permissions │
    └──────────────┬────────────┘
                   ↓
    ┌───────────────────────────┐
    │ 2. Create/find user       │
    └──────────────┬────────────┘
                   ↓
    ┌───────────────────────────┐
    │ 3. Define JDK variables   │
    └──────────────┬────────────┘
                   ↓
    ┌───────────────────────────┐
    │ 4. Switch to target user  │
    └──────────────┬────────────┘
                   ↓
    ┌───────────────────────────┐
    │ 5. Download & extract JDK │
    └──────────────┬────────────┘
                   ↓
    ┌───────────────────────────┐
    │ 6. Detect JDK directory   │
    └──────────────┬────────────┘
                   ↓
    ┌───────────────────────────┐
    │ 7. Setup environment vars │
    └──────────────┬────────────┘
                   ↓
    ┌───────────────────────────┐
    │ 8. Validate installation  │
    └───────────────────────────┘
