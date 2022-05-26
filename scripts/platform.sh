#! /bin/bash

if [ -z "$OS" ];
then export OS=$(uname);
else export OS=${OS};
fi
