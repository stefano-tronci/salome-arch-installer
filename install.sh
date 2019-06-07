#!/bin/bash

# Helper Script to install Salome on Arch Linux.
# Requires:
#   [*] python2.7 (provided by the package python2).
#   [*] gconf (provided by the package gconf)

FILE=$(ls *.run | grep Salome)

# Ensure that the file has been downloaded:
if [ -f $FILE ]; then
    echo "Unversal Binaries Installer in place"
else
    echo "ERROR: Unversal Binaries Installer not in place. Are you sure there is only a *.run file?"
    exit 1
fi

# Ensure Permissions:
chmod +x $FILE

# Extrapolate Version:
RAWVER=$(echo $FILE | grep -oP '(?<=Salome-V).*(?=-univ_public.run)') # X_Y_Z
COLVER=${RAWVER//_/} # XYZ
VER=${RAWVER//_/.} # X.Y.Z

# Set Environment Variables:
export SALOMEDIR="/home/${USER}/Salome-${COLVER}/Salome-V${RAWVER}-x86_64-univ"
export ROOT_SALOME="/home/${USER}/Salome-${COLVER}/Salome-V${RAWVER}-x86_64-univ"
export DEFAULTAPPLIDIR="/home/${USER}/Salome-${COLVER}/appli_V${RAWVER}"

# Run installer:
echo "Installing in /home/${USER}..."
./"${FILE}" -vt "/home/${USER}/Salome-${COLVER}"

# The installer was actually not successful. Let's fix that.
# First let's make the key scripts executable:
chmod +x "/home/${USER}/Salome-${COLVER}/Salome-V${RAWVER}-x86_64-univ/create_appli.sh"
chmod +x "/home/${USER}/Salome-${COLVER}/Salome-V${RAWVER}-x86_64-univ/salome_modules.sh"
chmod +x "/home/${USER}/Salome-${COLVER}/Salome-V${RAWVER}-x86_64-univ/salome_prerequisites.sh"
# Then, let's replace all python occurrences in create_appli.sh with python 2, so that it works.
sed -i -e 's/python/python2/g' "/home/${USER}/Salome-${COLVER}/Salome-V${RAWVER}-x86_64-univ/create_appli.sh"
#Now we can run it again
echo "/home/${USER}/Salome-${COLVER}/appli_V${RAWVER}" | "/home/${USER}/Salome-${COLVER}/Salome-V${RAWVER}-x86_64-univ/create_appli.sh"

# Create a launcher:
echo "Putting in place the Desktop Launcher: "

cat <<EOF >/home/"${USER}"/Salome-"${COLVER}"/Salome-"${COLVER}".desktop
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=salome-${COLVER}
Comment='An open-source software that provides a generic platform for Pre- and Post-Processing for numerical simulation'
Exec=python2.7 /home/${USER}/Salome-${COLVER}/appli_V${RAWVER}/salome
Icon=/home/${USER}/Salome-${COLVER}/Salome-V${RAWVER}-public/icon.png
Terminal=false
StartupNotify=false
Categories=Education;Science;Math;;
EOF

#TIP:
# If the launcher does not work, open /home/$USER/Salome-$COLVER/appli_V$RAWVER/runAppli, find the line export export APPLI=`${APPLI_HOME}/getAppliPath.py`, comment it and write below: export APPLI="/Salome-$COLVER/appli_V$RAWVER". Then, execute runApply

echo "ALL FINISHED!"
