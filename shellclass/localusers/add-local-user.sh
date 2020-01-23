#! /bin/bash
if [[ "${UID}" -eq 0 ]]
then
  echo "You are a root user.Please continue."
else
  echo "You are not root user. Please start as a root user."
  exit 1
fi
read -p "Enter the username to create : " USERNAME
read -p "Enter the name of the person or application that will be using this account : " NAME
read -p "Enter the password to use for this account : " PASSWORD
useradd -c "${NAME}" -m "${USERNAME}"
echo ${PASSWORD} | passwd --stdin ${USERNAME}
passwd -e ${USERNAME}
echo -e "\n\nUSERNAME: \n$USERNAME \n"
echo -e "\nPASSWORD: \n$PASSWORD \n"
echo -e "\nHOST:\n$HOSTNAME\n"
