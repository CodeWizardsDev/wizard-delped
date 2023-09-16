# ShowCase
0.00ms while idle, 0.04ms while deleting!

- IDLING:

  ![image](https://github.com/CodeWizardsDev/wizard-delped/assets/94300419/b94c1272-48f3-4c64-bfb4-27338607c744)


- DELETING:

  ![image](https://github.com/CodeWizardsDev/wizard-delped/assets/94300419/4b1725b0-7be1-4746-8ced-7b1cbeda8f46)


# Features
- 🧨 STAND ALONE
- 🗒️ Customizable Command
- ⛔ Customizable Command Permissions
- ⏱️ Customizable Command CoolDown With Timer
- 🎚️ Customizable Command Dead/All NPC Delete
- 🗺️ Customizable Default Distance (YOU CAN ALSO ENTER DISTANCE IN COMMAND, THIS IS FOR NO COMMAND DISTANCE INPUT)
- ➰ Customizable Retry Amount
- ‼️ Customizable Notify System ('StandAlone', 'QBCore', 'Esx', 'OkOk', 'Ox')

- 📡 Exports With Distance And Dead/All Input!

# Depencies
- NOTHING!

# Installation
- Drag and drop the file in your `resources` folder
- Add this to your server cfg server.cfg  `ensure wizard-delped`

- Open config.lua and edit `Notify` to your notification or use StandAlone
- Customize the script as you want!

 ## Exports
 - ### IMPORTANT: YOU CAN'T USE EXPORTS WITHOUT HAVING `source` FOR NOW
 - Distance: To use this option, you can set number on `exportdis`, `0.0` to everything!
 - DeadOnly: To use this option, set `exportdead` to true, if you want to make the export delete all peds, set `exportdead` to false!
 ```lua
 exports['wizard-delped']:DeletePeds(exportdis, exportdead)
 ```

  ## EXAMPLE
  - Delete All Peds Withing 100.0:
  ```lua
  exports['wizard-delped']:DeletePeds(100.0, false)
  ```

  - Delete Dead Peds Withing 100.0:
  ```lua
  exports['wizard-delped']:DeletePeds(100.0, false)
  ```

 ## Customizing
 - All config options are easy to understand!

# Support
- [Discord Server](https://discord.gg/ZBvacHyczY)
- Discord ID: mohammad_hs5
