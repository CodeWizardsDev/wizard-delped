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
- 🎚️ Customizable Command Driver/Walking/All NPC Delete (ONLY IF DEAD IS FALSE)
- 🗺️ Customizable Default Distance (YOU CAN ALSO ENTER DISTANCE IN COMMAND, THIS IS FOR NO COMMAND DISTANCE INPUT)
- ➰ Customizable Retry Amount
- ‼️ Customizable Notify System ('StandAlone', 'QBCore', 'Esx', 'OkOk', 'Ox')

- 📡 Exports With Distance, Player/Custom Location, Retry Ammount And Dead/All/Driving/Walking Input!

# Depencies
- NOTHING!

# Installation
- Drag and drop the file in your `resources` folder
- Add this to your server cfg server.cfg  `ensure wizard-delped`

- Open config.lua and edit `Notify` to your notification or use StandAlone
- Customize the script as you want!

 ## Exports
 ### YOU CAN SET 'none' INSTEAD OF ALL EXPORT OPTIONS TO USE DEFAULT CONFIG INFORMATION
 - Retry = You can set number of retries to remove peds! 
 - Distance: You can set number to remove peds within this distance
 - Type: `all` to remove all peds within distance, `dead` to remove dead peds within distance, `walking` to remove walking peds within distance and `driving` to remove driving peds within distance
 - Pos: You can ignore this to use source player coords, if you want custom coords, just use vector3 here!
 ```lua
 exports['wizard-delped']:DeletePeds(Retry, Distance, Type, Pos)
 ```

  ## EXAMPLE
  - Delete All Peds Withing 100.0:
  ```lua
  exports['wizard-delped']:DeletePeds('none', 100.0, 'all')
  ```

  - Delete Dead Peds Withing 100.0:
  ```lua
  exports['wizard-delped']:DeletePeds('none', 100.0, 'dead')
  ```

  - Delete Dead Peds Withing 100.0 And 5 Retries:
  ```lua
  exports['wizard-delped']:DeletePeds(5, 100.0, 'dead')
  ```

  - Delete Dead Peds Withing 100.0 From vector3(789.85, -1765.84, 29.68) And 5 Retries:
  ```lua
  exports['wizard-delped']:DeletePeds(5, 100.0, 'dead', vector3(789.85, -1765.84, 29.68))
  ```

 ## Customizing
 - All config options are easy to understand!

# Support
- [Discord Server](https://discord.gg/ZBvacHyczY)
- Discord ID: mohammad_hs5
