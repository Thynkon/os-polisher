#!/usr/bin/env bash

user=$1

dnf remove korganizer kmail akregator knode krdc krfb konqueror ktnef kaddressbook konversation kf5-akonadi-server

sed -i 's/StartServer.*/StartServer=false/' "/home/${user}/.config/akonadi/akonadiserverrc"
