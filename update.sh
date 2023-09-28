#!/bin/bash

# Correct arguments
if [ $# -eq 0 ]; then
  echo "Por favor, proporciona la versión como argumento."
  exit 1
fi

git checkout develop
echo "Branch changed to develop"

version=$1

# Modify files
sed -i "s|^\(danielzufri/myapp:\).*|\1$version|" myapp/config.ini
sed -i "s|version [0-9.]\+|version $version|" myapp/templates/index.html

# Push
git add myapp/config.ini myapp/templates/index.html
git commit -m "New version: $version"
git push origin develop

echo "Archivos modificados exitosamente con la versión $version."
