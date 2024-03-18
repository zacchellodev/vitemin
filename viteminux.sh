#!/bin/bash

read -p "package.json Name: " name

# set default value in case of empty name
if [ -z "$name" ]; then
  name="my-vitemin-project"
fi

# cloning template
git clone https://github.com/zacchellodev/vitemin-template.git
mv "vitemin-template" "$name"
echo "" >> "./$name/.gitignore"
echo "*.env" >> "./$name/.gitignore"

# creating package.json
cat <<EOF > package.json
{
  "name": "$name",
  "private": true,
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
  },
  "devDependencies": {
    "@types/react": "^18.2.67",
    "@types/react-dom": "^18.2.22",
    "@vitejs/plugin-react-swc": "^3.6.0",
    "tsc": "^2.0.4",
    "typescript": "^5.4.2",
    "vite": "^5.1.6"
  }
}
EOF

mv "package.json" "$name"

# quickstart
clear

echo "To get started:"
echo "cd $name"
echo "yarn"
echo "yarn dev"

echo ""
