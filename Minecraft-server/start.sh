#!/bin/bash
sudo java -Xmx6144M -Xms6144M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui &


# Function to check if the specified string is present in the log file
check_string_in_log() {
    if grep -q "Starting Minecraft server" /content/drive/MyDrive/Minecraft-server/logs/latest.log; then
        # Run the second process in parallel
        sudo ssh -oStrictHostKeyChecking=no -R 25565:127.0.0.1:25565 serveo.net
        # Exit the function so it won't run the second process multiple times
        exit 0
    fi
}

# Loop to check the log file every 1 second for the specified string
while true; do
    # Call the function to check for the string
    check_string_in_log
    # Wait for 1 second before checking again
    sleep 1
done


#!/bin/bash
sudo java   -jar  nogui &
sleep 25
ssh -oStrictHostKeyChecking=no -R 25565:127.0.0.1:25565 serveo.net
