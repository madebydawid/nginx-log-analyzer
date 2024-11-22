# Nginx Log Analyzer

This script is ment to analyze Nginx access log files from the command line. Thus giving the user valuable information about IP addresses, requested paths, response status, codes, and user agents from the log file.


# Features

- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 response status codes
- Top 5 user agents

# Requirements

- The script is designed to run on Unix-based systems (Linux/macOS).
- You need to have access to an Nginx access log file (in standard log format).
- `awk`, `sort`, `uniq`, and `head` commands should be available on your system.

# How to use it

1. Clone the repository or download the script.
2. Make the script executable:
```bash
chmod +x log-analyze.sh
```

3. Run the script by passing the Nginx access log file as an argument:
```bash
sudo ./analyze.sh /path/to/nginx-access.log
```

4. **Output**

```bash
Top 5 IP Addresses with Most Requests:
IP Address           Count
178.128.94.113       1087 requests
142.93.136.176       1087 requests
138.68.248.85        1087 requests
159.89.185.30        1086 requests
86.134.118.70        277 requests 

Top 5 Most Requested Paths:
Path                           Count
/v1-health                     4560 requests
/                              270 requests
/v1-me                         232 requests
/v1-list-workspaces            127 requests
/v1-list-timezone-teams        75 requests

Top 5 Response Status Codes:
Status Code     Count
200             5740 requests
404             937 requests
304             621 requests
400             192 requests
"-"             31 requests

Top 5 User Agents:
User Agent                                         Count
DigitalOcean                                       4347 requests
Mozilla/5.0                                        513 requests
Mozilla/5.0                                        332 requests
Custom-AsyncHttpClient                             294 requests
Mozilla/5.0                                        282 requests
```

---
[Link to roadmap.sh](https://roadmap.sh/projects/nginx-log-analyser)
