# Canob Auto Loot
There is my automatic autoloot changer created to the Canob OT, you can easily install it on your bot and your autoloot will change automatically when you kill the first monster configured on list.

## How to install:
1. Open your canob client and log into one of your characters
2. Open the bot interface and click on Edit option
3. Click on the button as shown in the image below to open the scripts directory
![alt text](https://github.com/alldevbr/canobautoloot/blob/main/imgs/open_bot_folder.PNG?raw=true)

4. In the windows interface open the folder that have the name that you use in your configurations, such as "cavebot_1.3"
5. Paste the two files (download them here) there:
- canob_autoloot.lua
- canob_monsters_loot.lua

## Ignore a specific monster (aka: Moon Dragon + Smaug)
If you want to ensure that you will focus the autoloot on the monster with most valuable items you can choose to ignore the another monster following these steps:
1. Open the **canob_autoloot.lua** and add how many monsters names that you want to ignore on the variable **ignoreMonster**, like in the example below:

```
local ignoreMonster = { 
    "smaug", "fenrir", "trainer", "cat", "dog"
}
```
2. Save the file and reload the bot

----------

Demo video: https://youtu.be/oPBBFPm5NCQ
