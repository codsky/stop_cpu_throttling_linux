# stop_cpu_throttling_linux
A bash script to stop CPU throttling on most Dell PCs

The script utilizes [cpufrequtils](https://www.thinkwiki.org/wiki/How_to_use_cpufrequtils) and [msr-tools](https://packagehub.suse.com/packages/msr-tools/)

# Usage
1. Give the script file execution permission. Make sure you are in the right directory where the file resides.  
   `sudo chmod +x stop_throttling.sh`
   
3. Running the script
  - For the first time:  
    `./stop_throttling.sh -install-packages true`   
    This installs cpufrequtils and msr-tools which we need for the this script.

  - Subsequence execution (e.g. later after restarting your PC and it still throttles)   
    `./stop_throttling.sh`

  That is it! Enjoy! Please star this repo if it helped you!
