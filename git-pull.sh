#!/bin/bash

cd ../mocap-frontend && git pull --rebase --autostash
cd ../mocap-backend && git pull --rebase --autostash
cd ../mocap-keycloak && git pull --rebase --autostash