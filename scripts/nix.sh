#!/bin/bash

# Generated by Spellcaster
# © 2022, Stephen Lauck. All rights reserved.

exec > >(sudo tee -a /var/log/spellcaster.log) 2>&1
start_time="$(date -u +%s)"
echo -en "\e[0;37m"
cat << "EOF"
 __                        
(_ ._  _ || _ _. __|_ _ ._ 
__)|_)(/_||(_(_|_> |_(/_|  
   |                       
EOF
echo $start_time
echo -e "Converging 2 resources..."
converge=""
cycle=0
converged="$(printf "%0.s\\u2631 "  {1..2})"
echo -en "\e[0m"

while [ "$converge" != "$converged" ] && [ $cycle -le 2 ]
  do
    converge=""
    echo -en "\e[0;34m"
    echo -e "resource: nix"
    echo -en "\e[0m"

    r_out=$(test -d /nix)
    r_exit=$?
    if [ 0 = $r_exit ]
    then
      c_exit=0
      echo -en "\e[0;34m"
      echo -e "  attribute: /nix should exist"
      echo -en "\e[0m"
      echo -en "\e[0;32m"
      echo -e "    expected 0 and received $r_exit"
      echo -en "\e[0m"
      u_exit=1
    else
      c_exit=1
      echo -en "\e[0;31m"
      echo -e "  attribute: /nix should exist"
      echo -e "    expected 0 and received $r_exit"
      echo -en "\e[0m"
      u_out=$(sudo install -d -m755 -o $(id -u) -g $(id -g) /nix)
      u_exit=$?
    fi
    # echo "$r_exit$c_exit$u_exit"
    case "$r_exit$c_exit$u_exit" in
    000) converge="$converge$(echo -e "\u2630") ";;
    001) converge="$converge$(echo -e "\u2631") ";;
    010) converge="$converge$(echo -e "\u2632") ";;
    011) converge="$converge$(echo -e "\u2633") ";;
    100) converge="$converge$(echo -e "\u2634") ";;
    101) converge="$converge$(echo -e "\u2635") ";;
    110) converge="$converge$(echo -e "\u2636") ";;
    111) converge="$converge$(echo -e "\u2637") ";;
    esac

    echo -en "\e[0;34m"
    echo -e "resource: nix"
    echo -en "\e[0m"

    r_out=$(sudo -i -u $USER nix-env --version)
    r_exit=$?
    if [ 0 = $r_exit ]
    then
      c_exit=0
      echo -en "\e[0;34m"
      echo -e "  attribute: nix should be installed multi-user"
      echo -en "\e[0m"
      echo -en "\e[0;32m"
      echo -e "    expected 0 and received $r_exit"
      echo -en "\e[0m"
      u_exit=1
    else
      c_exit=1
      echo -en "\e[0;31m"
      echo -e "  attribute: nix should be installed multi-user"
      echo -e "    expected 0 and received $r_exit"
      echo -en "\e[0m"
      u_out=$(curl -L https://nixos.org/nix/install | sh -s -- --daemon)
      u_exit=$?
    fi
    # echo "$r_exit$c_exit$u_exit"
    case "$r_exit$c_exit$u_exit" in
    000) converge="$converge$(echo -e "\u2630") ";;
    001) converge="$converge$(echo -e "\u2631") ";;
    010) converge="$converge$(echo -e "\u2632") ";;
    011) converge="$converge$(echo -e "\u2633") ";;
    100) converge="$converge$(echo -e "\u2634") ";;
    101) converge="$converge$(echo -e "\u2635") ";;
    110) converge="$converge$(echo -e "\u2636") ";;
    111) converge="$converge$(echo -e "\u2637") ";;
    esac

    echo -e "cycle $cycle"
    echo -e "$converge"
    echo -e "$converged"
    (( cycle++ ))
done

end_time="$(date -u +%s)"

if [ "$converge" = "$converged" ]
then
  elapsed="$(($end_time-$start_time))"
  echo -en "\e[0;37m"
  echo -e "Spellcaster converged in $cycle cycles"
  echo -e "Convergence time: $elapsed seconds"
  echo -en "\e[0m"
  exit 0
else
  elapsed="$(($end_time-$start_time))"
  echo -en "\e[0;37m"
  echo -e "Spellcaster failed to converge in $cycle cycles"
  echo -e "Convergence time: $elapsed seconds"
  echo -en "\e[0m"
  exit 1
fi
