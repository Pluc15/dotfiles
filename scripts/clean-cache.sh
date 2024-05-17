#!/bin/sh
docker image prune -a -f
docker builder prune -f
docker volume prune -f
docker network prune -f
docker container prune -f
dotnet nuget locals all -c
yarn cache clean --all
npm cache clean --force
echo "= Manual cleanups ="
echo "JetBrains Toolbox - Clear old jetbrains IDEs by end. Press any key when done."
read
