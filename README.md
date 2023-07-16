Apktool-installer

This Bash script is designed to automate the installation of apktool to the latest version. It provides a solution for errors related to apktool in Metasploit, as the default version installed with apt install apktool may not be fully compatible. This script is specifically created for Kali Linux.
Installation

To install apktool using this script, follow these steps:

    Ensure that any existing versions of apktool are removed from your system.

    Clone this repository to your local machine.

    Open a terminal and navigate to the directory where the script is located.

    Run the following command:

    sudo chmod +x apktool-installer.sh && sudo ./apktool-installer.sh

    This will execute the script and automate the installation process.

Dependencies

The script requires the following dependencies to be installed:

    ping
    curl
    wget

Ensure that these dependencies are installed on your system before running the script. If any of these dependencies are missing, the script will automatically attempt to install them.
Usage: Once the installation is complete, you can use apktool as needed. Refer to the apktool documentation for instructions on how to use the tool effectively.
