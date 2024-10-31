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
- awk, sort, uniq, and head commands should be available on your system.

# How to use it

1. Clone the repository or download the script.
2. Make the script executable:
```bash
chmod +x log-analyze.sh
```

3. Run the script by passing the Nginx access log file as an argument:
```bash
sudo ./log-analyze.sh /path/to/nginx-access.log
```

4. **Output**

---
[Link to roadmap.sh]https://roadmap.sh/projects/nginx-log-analyser