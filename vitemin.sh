#!/bin/bash

# made by: https://www.zacchello.site/

echo "🍊 Vitemin 🍊"

read -p "NAME YOUR PROJECT: " projectName

# "default" value in case of empty name
if [ -z "$projectName" ]; then
  projectName="my-vitemin-project"
fi

mkdir "$projectName"

#region package.json
echo '{' > package.json

echo '  "name": "'$projectName'",' >> package.json
echo '  "private": true,' >> package.json
echo '  "version": "1.0.0",' >> package.json
echo '  "type": "module",' >> package.json

echo '  "devDependencies": {' >> package.json
echo '    "@types/react": "^18.2.73"' >> package.json
echo '  },' >> package.json

echo '  "dependencies": {' >> package.json
echo '  },' >> package.json

echo '  "scripts": {' >> package.json
echo '    "dev": "vite",' >> package.json
echo '    "build": "tsc && vite build",' >> package.json
echo '    "preview": "vite preview"' >> package.json
echo '   }' >> package.json

echo '}' >> package.json

mv package.json "$projectName"
#endregion

# quickstart guide
clear

echo "To get started:"
echo "cd $projectName"
echo "yarn dev"
