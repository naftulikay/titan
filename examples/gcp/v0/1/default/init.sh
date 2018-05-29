#!/bin/bash

set -eo pipefail

function log() {
  local level="$1" && shift
  logger -t startup-script -s "[$(printf '%-5s' "${level}")] $@"
}

function trace() { log TRACE $@ ; } 
function debug() { log DEBUG $@ ; }
function info() { log INFO $@ ; }
function warn() { log WARN $@ ; }
function error() { log ERROR $@ ; }

info "Setting up sudo system group and sudoers permissions..."

# check for existence of a sudo group
if ! awk -F ':' '{print $1;}' /etc/group | grep -qP '\b(?:sudo)\b' ; then
  debug "Creating sudo group..."
  groupadd -r sudo
fi

# check for permissions on sudo group; remove them from files we don't care about
grep -lPR '^\%sudo.*$' /etc/sudoers /etc/sudoers.d | sort -u | while read matched_file ; do
  if [ "$(basename "${matched_file}")" == "90-sudo" ]; then
    continue
  fi

  debug "Removing sudoers permissions for the sudo group found in ${matched_file}..."
  sed -i '/^\%sudo.*$/d' "${matched_file}"
done || true

# add the permissions every time
debug "Creating sudoers permissions for the sudo group..."
cat > /etc/sudoers.d/90-sudo <<EOF
%sudo ALL=(ALL:ALL) NOPASSWD:ALL
EOF

# user time
info "Setting up user..."

# create my user, import the gnupg key, get ssh keys, verify them
if ! id naftuli &>/dev/null ; then
  useradd -c "Naftuli Kay" -G adm,sudo -m -s /bin/bash naftuli
fi

# setup keys
info "Installing SSH keys..."
install -o naftuli -g naftuli -m 0700 -d /home/naftuli/.ssh

cat > /home/naftuli/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7TJJFbbnTzhYju0v2sUL41Wh3xZZkLS2U9GxqHhCUvFsVwsYAAewIOazOaPxFkmVB4cm+C+A072cTVBEn4zt8BxzKqp2HcphxkSj7XS3kLJBeg4ekIEO/omK5HJwHQnOtOuOQD0UHz9A8MiO7IxWTZAq9uMkRTtvwTEQMEHqJ9NpsRuhVYG7iMQAwyurGB2WzXHWpbknaYvgs+2qPnLDjPIrA81EiHbluW+Z53jcDPD0nMKuvnDxnKqw2bFoY93KidsdVkIQ2fYjXkLVDpSgHh8tayipS+UNDEGm8Yxue87FMUBB3F0Xr9HpbaBy5MHCgif7kzejBsZXMW/xtLSxrac2C78Tm+kG0jRORuDBed1CP1+nd7RijQJ/E7lXfa6hJaYR3MPJ2lVAdYCxv1B1eluIKVJkcaAJrY/TXJNwtrhiJR1c/uzm8CIkWoCKo8RxgyUPSBpVvBNH7As61nQZOGlEaSEq6KEfeEhci+/LLprXREEhalG3oJYW0aZ68gk2gVoxe94Z7SJoF8X1Z+jI5TBHDz/N/bKvcgbnzwFRZPLKrJyldwE2EvoJVYyis3Jw5jJzGouKaRnvqIbMMgUaxRI3ASPrSNY9GDR3yXyWbrv/e7IQOaOOk/DRIOV0+/tLTtRGZNF/X+6u9hjTDJyWf1U7AVajJShvN1yjsEHLJcw== naftulikay:2
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDVS3OqBwIJixHjEWeYsVZMtMML46KhKzhl/4a2FA0jKf40W3jwNndVIZ3xPtcafe3fxTx0HthGknuJ/x2DEZcOJ5usbmx4CxoJP0laHmt8RqQ73bYRdSPX9NM6JZHwAuyhY7w2Y8pIWX7MbaYf7mf7xvZWbRmNAJXapm/s+UrLHbJIfiQGKuWW2YTyKzz+6vMrYrJaPhVsLgnnyrAoEbokB2T9Z0CwKsbsTjPVQLZ9lZ7z+9piW8s7U/ue5dETb4SUOuypAcSEd+q0/Vd0SeentOr1cnQ8Uojt0K1VMm+5lYmjERB6C0fOW60TEqfA9fvNI6DEDmrM2TxagBHgoIP1ApmqLYiQp9AWTszBf9Ta1k6JYtFRhI9RgBI9YfCX+2htmXpPmqj8XRufxQxw8fKZAAfNoZQJ1beiqNglyEEFDc344GJr23qcWqV1KEBNzIvKR/uxpGdgm7zDGVpfbru3tAgnZd7tFukTLWo2/XEsv8wQo+aHKUxJUUVjUD+IybCI2oLGNsq+UTCyOJXtQZCeUFlOJhI0yyP+6XzgO6HupOoZwzS3s257p5WD4q2jUA1ZutjweXymiwoZU3o+6jU6Jir5NUIHJmT/XGD3ZKK25Cupx91fxWFnKUq3U9KoN09wREizkPEogVQBDWE8WdkB87PZPgFfQCVV0gHv9JzmQ== naftulikay:1
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCu4PKXWiS+H74JHeoo13eYwSnVFKlFvqBP/TfMXD5gYoCkiBTJnuoMDAjXmm52oyZQI7l9zdKF45otohSK7DUq56fiLvzQEXn7/R2KJzAP6wTdaql2i3JO31vMn4N2PEvd70wA+CVYm7kjNbaSGUSNY0LDi+a4pvqFpMKB5Y1Dyq1Op87ZrZlnuLEPnXrp73STFk0mdEGgq0uOcaun7tyeK63a5JBSiWSQq7Tw4BTqvvd7diqtI7zbepvxwprUoNBLk9qsUqaNHHUOMQM7Of9WdPDSb++ZaKwVeaL3uiBLt3mOPU9AgoMqxHAU9+8j+Y5vdGDbkvh258AqFQ/lxQayK0UejvhzsX2AxWb18C6UgNHewMsldEvE7l2CnzrPuzRp3GLfm1p8FMJch98Focl54f4WgsedIJ27V5tcaUvG5qTiASeqqIibl1eww42RhMmYyCB3oOh1cOmsswxTVhd5xOTMB7+Jayi3gN8FGXeJRI2i/grRpZiMt8aonbQMhOYzNapM2RCMaoO/0GDZXAmSFxROrlCKFJQTW58eRCPo9TNuNVQw3Z1Q2tKxgKMyNVPnSbeC1PqsGzbfBmqfjjlqQf0FZxefAsk9EJNd4Omfni4Wc/brcz7o+s3pOZf+qmcRRUNIfkH3CAAand32Xgd4U3dj2EtsYwRghiuWxTV96Q== naftulikay:0
EOF

chown -R naftuli:naftuli /home/naftuli
chmod 0600 /home/naftuli/.ssh/authorized_keys
