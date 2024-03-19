#!/bin/bash

# made by: https://www.zacchello.site/

read -p "package.json Name: " name

# "default" value in case of empty name
if [ -z "$name" ]; then
  name="my-vitemin-project"
fi

# cloning template
git clone https://github.com/zacchellodev/vitemin-template.git
mv "vitemin-template" "$name"
echo "" >> "./$name/.gitignore"
echo "*.env" >> "./$name/.gitignore"

# creating package.json
echo '{' > package.json
echo '  "name": "'"$name"'",' >> package.json
echo '  "private": true,' >> package.json
echo '  "version": "1.0.0",' >> package.json
echo '  "type": "module",' >> package.json
echo '  "scripts": {' >> package.json
echo '    "dev": "vite",' >> package.json
echo '    "build": "tsc && vite build",' >> package.json
echo '    "preview": "vite preview"' >> package.json
echo '  },' >> package.json
echo '  "dependencies": {' >> package.json
echo '    "react": "^18.2.0",' >> package.json
echo '    "react-dom": "^18.2.0"' >> package.json
echo '  },' >> package.json
echo '  "devDependencies": {' >> package.json
echo '    "@types/react": "^18.2.67",' >> package.json
echo '    "@types/react-dom": "^18.2.22",' >> package.json
echo '    "@vitejs/plugin-react-swc": "^3.6.0",' >> package.json
echo '    "tsc": "^2.0.4",' >> package.json
echo '    "typescript": "^5.4.2",' >> package.json
echo '    "vite": "^5.1.6"' >> package.json
echo '  }' >> package.json
echo '}' >> package.json
mv "package.json" "$name"

# REMOVE .git FOLDER
rm -rf "$name/.git"

# quickstart
clear

echo "To get started:"

echo "cd $name"
echo "yarn"
echo "yarn dev"

echo ""
