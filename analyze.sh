#!/bin/bash

# Define color codes for headers
YELLOW='\033[1;33m'  # Yellow color
NC='\033[0m'         # No color (reset)

##########################################################################################
### Script to analyze an Nginx nginx-access log file and extract the top 5 entries for ###
### IP addresses, requested paths, response status codes, and user agents.             ###
##########################################################################################

# Check if log file is provided as an argument
if [ $# -ne 1 ]; then
    echo "To use the analyzer tool, provide the file location as follows: $0 <nginx-access-log-file>"
    exit 1
fi

LOG_FILE=$1

# Check if the log file exists and is readable
if [[ ! -f "$LOG_FILE" ]]; then
    echo "Error: Log file '$LOG_FILE' does not exist or is not readable."
    exit 1
fi

# Section 1: Top 5 IP addresses with the most requests
echo -e "${YELLOW}Top 5 IP Addresses with Most Requests:${NC}"
# Extracts the first column (IP addresses), sorts, counts, and shows the top 5 in columns
printf "%-20s %s\n" "IP Address" "Count"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{printf "%-20s %s\n", $2, $1 " requests"}'

# Section 2: Top 5 Most Requested Paths
echo -e "\n${YELLOW}Top 5 Most Requested Paths:${NC}"
# Extracts the seventh column (paths), sorts, counts, and shows the top 5 in columns
printf "%-30s %s\n" "Path" "Count"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{printf "%-30s %s\n", $2, $1 " requests"}'

# Section 3: Top 5 Response Status Codes
echo -e "\n${YELLOW}Top 5 Response Status Codes:${NC}"
# Extracts the ninth column (status codes), counts, and shows the top 5 in columns
printf "%-15s %s\n" "Status Code" "Count"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{printf "%-15s %s\n", $2, $1 " requests"}'

# Section 4: Top 5 User Agents
echo -e "\n${YELLOW}Top 5 User Agents:${NC}"
# Extracts the twelfth column (user agents), sorts, counts, and shows the top 5 in columns
printf "%-50s %s\n" "User Agent" "Count"
awk -F'"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{printf "%-50s %s\n", $2, $1 " requests"}'
