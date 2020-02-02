#! /bin/bash
if [[ "${UID}" -eq 0 ]]
then
  echo "You are a root user.Please continue."
else
  echo "You are not root user. Please start as a root user."
  exit 1
fi

USERNAME=${1:error}
COMMENT=${2:enter_a_username}
useradd -c "${COMMENT}" -m "${USERNAME}"
pass=$(echo "date +%s%N${RANDOM}${RANDOM}" | sha256sum | head -c42)
sc=$(echo '!@#$%^&*()_-=+' | fold -w1 | shuf | head -c1)
echo "${pass}${sc}" | passwd --stdin ${USERNAME}
passwd -e ${USERNAME}
echo -e "\n\nUSERNAME: \n$USERNAME \n"
echo -e "\nPASSWORD: \n$pass$sc \n"
echo -e "\nHOST:\n$HOSTNAME\n"
