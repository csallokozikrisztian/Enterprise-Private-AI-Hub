#!/bin/bash

# ==============================================================================
# Enterprise Private AI Hub - Deployment Initialization Script
# Description: Prepares the host environment for the Air-Gapped AI Stack.
# ==============================================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}Starting Private AI Hub Environment Setup...${NC}\n"

if ! command -v docker &> /dev/null; then
    echo -e "${RED}[ERROR] Docker is not installed. Please install Docker first.${NC}"
    exit 1
else
    echo -e "${GREEN}[OK] Docker is installed.${NC}"
fi

echo -e "\n${BLUE}Creating persistent data directories...${NC}"

mkdir -p ./nginx/data
mkdir -p ./nginx/letsencrypt
mkdir -p ./open-webui
mkdir -p ./ollama

echo -e "${GREEN}[OK] Directories created successfully.${NC}"

echo -e "\n${BLUE}Applying strict security permissions...${NC}"
chown -R 1000:1000 ./open-webui
chmod -R 755 ./nginx
chmod -R 755 ./ollama

echo -e "${GREEN}[OK] Permissions secured.${NC}"

echo -e "\n${GREEN}================================================================${NC}"
echo -e "${GREEN} SUCCESS! The environment is ready for deployment. ${NC}"
echo -e "${GREEN}================================================================${NC}"
echo -e "Next steps:"
echo -e "1. Review the 'docker-compose.yml' file."
echo -e "2. Run: ${BLUE}docker compose up -d${NC}"
echo -e "3. Apply the custom Nginx tuning parameters described in the README."
echo -e "================================================================\n"
