## Opening Notes
This repository serves as a more up-to-date version of Scrappy's practice tool, built upon project bo4. Note that this is only the GSC folder, which is where the speedrunning practice tools reside. 

Project BO4 and Practice tool installation instructions found on Scrappy's github page found below.

Link to Practice Tool: https://github.com/Joshr520/BO4-Practice

## Getting Started

This guide assumes that the user already has Project BO4 installed. 
This repo edits the code inside of project-bo4/mods/BO4 Practice/GSC

If you are not familiar with git commands, simply download the repo source code and replace the existing GSC folder with the new one, when new patches are supported.

If you are familiar with, or want to use git to quickly update the GSC folder, follow the steps below. <br>

### Cloning GSC folder
    0. Install git on your system 
    1. Navigate to GSC folder
        1a. Move the GSC folder to a different location to keep as a backup, or just delete the folder
    2. git clone git@github.com:jakobbindas/GSC.git

Now, you have an initial version of this repo in whatever state the repo is currently in. If you have the repo cloned already and see there are new patches available, simply run the following commands to update your local copy.

### Updating GSC folder
```
    git pull origin master 
```

from inside of the GSC folder. This should keep unchanged files unchanged, while adding in new functionality.

## Map Names
- zm_escape: Blood of the Dead
- zm_mansion: Dead of the Night
- zm_office: Classified
- zm_orange: Tag der Toten
- zm_red: Ancient Evil
- zm_towers: IX
- zm_white: Alpha Omega
- zm_zodt8: Voyage of Despair


## Available Patches
#### Alpha Omega
1. boss
    - Credit: aidanolf & Bindy
    - Start the game on round 12 at the console by the APD. Timer starts 3 seconds after teleporting to console, so try to interact with the console to start with proper timing. Supports collecting the shard at the end and playing the ending cutscene.

#### Blood of the Dead
1. chals <br>
    - Credit: Scrappy
    - Start the game on round 12, right before challenges first start. Once you are able to move, you are expected to interact with the book to get your first code.

2. birds <br>
    - Credit: Bindy
    - Start the game on round 7 in spawn. Clear a bit of the round before interacting with the orb poster and kronorium to spawn the first bird. Location of birds 2, 3 and 4 are outputted on the screen to the user to learn where the streaks point. If you would like this turned off, comment out the line with print_birds() and recompile. Future support will add this as a setting.

3. boss <br>
    - Credit: Scrappy
    - Start the game in the boss fight.

#### Dead of the Night 
Credit: Scrappy for each of these
1. lockdown_1: Start the game at the greenhouse lockdown. Interact with the stone to start the lockdown.

2. lockdown_2: Start the game at the cemetery lockdown. Interact with the stone to start the lockdown.

3. lockdown_3: Start the game at the forest lockdown. Interact with the stone to start the lockdown.

4. lamps: Start the game at the greenhouse lockdown. Interacting with the stone will start the lockdown, and then instantly end it. From here you can practice getting your dig folly upgrade part or go straight to lamps to practice that.

5. boss: Start the game in the boss fight.

#### Voyage of Despair
1. free_kraken
    - Credit: Scrappy
    - Start the game on the poop deck, where the free kraken egg is. You will get notified every time you enter or leave the path for the free kraken.


## Future Patch Ideas
#### Voyage of Despair
1. Plugs: Start user on round 9 at artifact with clocks finishing to practice plug segment
2. Planets: Start at cargo on round 13 to read planets and shoot all in segment. This was implemented somewhere before by Scrappy, but I need to dig it up and toss in this folder.
3. Boss: Start on iceberg tp and interact to start boss fight

