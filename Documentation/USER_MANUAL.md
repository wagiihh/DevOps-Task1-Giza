# 🌱 **Java Installer Script -- **

Welcome!\


# 📚 **Table of Contents**

1.  [Purpose of the Script](#-purpose-of-the-script)
2.  [How It Works (Quick Overview)](#-how-it-works-quick-overview)
3.  [Prerequisites](#-prerequisites)
4.  [How to Run the Script](#-how-to-run-the-script)
5.  [What the Script Installs](#-what-the-script-installs)

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

-   ✔️ Linux machine\
-   ✔️ Root access (sudo)\
-   ✔️ Internet connection

### Required Tools

-   `curl`
-   `tar`

To check:

``` bash
curl --version
tar --version
```

------------------------------------------------------------------------

# ▶️ **How to Run the Script**

### **1. Save the script**

Name it:

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

That's all you need.\
The script handles everything else automatically.

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
# 🎉 **Done!**
