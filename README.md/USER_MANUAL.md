# 🌱 **Java Installer Script ---**

Welcome!

------------------------------------------------------------------------

# 📚 **Table of Contents**

1.  [Purpose of the Script](#-purpose-of-the-script)
2.  [How It Works (Quick Overview)](#-how-it-works-quick-overview)
3.  [Prerequisites](#-prerequisites)
4.  [How to Run the Script](#-how-to-run-the-script)
5.  [What the Script Installs](#-what-the-script-installs)
6.  [Troubleshooting](#-troubleshooting)
7.  [Possible Messages & How to Handle
    Them](#-possible-messages--how-to-handle-them)

------------------------------------------------------------------------

# 🎯 **Purpose of the Script**

This script provides a **simple and reproducible way** to install
**OpenJDK 21** for a specific Linux user **without** relying on package
managers.

It is useful when: - You want consistent JDK installations across
machines. - You don't want system‑wide Java that affects other
applications. - You want a clean, isolated Java environment under one
user.

------------------------------------------------------------------------

# ⚡ **How It Works (Quick Overview)**

    [Run Script as Root]
            ↓
    [Ask for Username]
            ↓
    [Create User If Needed]
            ↓
    [Download JDK 21]
            ↓
    [Extract JDK Under /home/<user>/java]
            ↓
    [Set JAVA_HOME + PATH]
            ↓
    [Verify Installation]

A simple, predictable workflow.

------------------------------------------------------------------------

# 🛠️ **Prerequisites**

Before running the script, make sure:

### System Requirements

-   ✔️ Linux machine
-   ✔️ Root access (sudo)
-   ✔️ Internet connection

### Required Tools

-   `curl`
-   `tar`

Check tools using:

``` bash
curl --version
tar --version
```

------------------------------------------------------------------------

# ▶️ **How to Run the Script**

### **1. Save the script**

Save your script as:

    asst1.sh

### **2. Make it executable**

``` bash
chmod +x asst1.sh
```

### **3. Run it as root**

``` bash
sudo ./asst1.sh
```

### **4. Enter the username when prompted**

Example:

    pet-clinic

That's it --- the script handles everything else automatically.

------------------------------------------------------------------------

# 📦 **What the Script Installs**

### 📁 JDK Installation Path

    /home/<user>/java/jdk-21...

### 🔧 Environment Variables Added to `.bashrc`

``` bash
export JAVA_HOME=/home/<user>/java/jdk-21...
export PATH="$JAVA_HOME/bin:$PATH"
```

### 🧪 Validate Installation

``` bash
sudo -u <user> -s
java -version
```

------------------------------------------------------------------------

# 🧯 **Troubleshooting**

General issues such as path problems, missing tools, or permissions can
often be resolved by checking `.bashrc`, ensuring `sudo` was used, or
confirming network access.

------------------------------------------------------------------------

# 📨 **Possible Messages & How to Handle Them**

## 🔐 **1. "Run as root"**

**Meaning:** Script was run without enough permissions.\
**Fix:**

``` bash
sudo ./asst1.sh
```

------------------------------------------------------------------------

## 👤 **2. "User '`<name>`{=html}' already exists."**

**Meaning:** The username already exists on the system.\
**Fix:** Safe to continue. No action needed.

------------------------------------------------------------------------

## 👤 **3. "Creating user '`<name>`{=html}'..."**

**Meaning:** Script is creating the user.\
**Fix:** No action required.

------------------------------------------------------------------------

## 🌐 **4. "curl: (6) Could not resolve host"**

**Meaning:** No internet or DNS problem.\
**Fix:**\
- Check internet\
- Retry\
- Test DNS:

``` bash
ping google.com
```

------------------------------------------------------------------------

## 🌐 **5. "curl: (22) The requested URL returned error: 404"**

**Meaning:** JDK URL changed.\
**Fix:** Update:

``` bash
JDK_URL="https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz"
```

------------------------------------------------------------------------

## 📦 **6. "tar: Error opening archive"**

**Meaning:** JDK not downloaded correctly.\
**Fix:**

``` bash
rm ~/java/jdk.tar.gz
```

Re‑run script.

------------------------------------------------------------------------

## 📁 **7. "No JDK directory found"**

**Meaning:** Extraction failed.\
**Fix:**\
Check:

``` bash
ls /home/<user>/java/
```

------------------------------------------------------------------------

## 🔧 **8. "java: command not found"**

**Meaning:** Environment variables not active yet.\
**Fix:**

``` bash
source ~/.bashrc
```

------------------------------------------------------------------------

## 📝 **9. "Permission denied"**

**Meaning:** Script not executable.\
**Fix:**

``` bash
chmod +x asst1.sh
```

------------------------------------------------------------------------

# 🎉 **Done!**
