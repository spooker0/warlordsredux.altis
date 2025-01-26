class TaskThirdPerson: WLTaskTutorialUiMechanics {
    name = "Third Person View";
    description = "You can toggle the third person camera by pressing %1. In Warlord Redux, the third person view can be enabled or disabled. Disabling it gives you an income bonus for every kill. It is disabled by default. Enable it by using the scroll wheel menu, find the Settings menu, and enable the third person view. Keep in mind that this toggle has a cooldown to prevent abuse. Open the settings menu to complete this task.";
    args[] = {
        "actionKeysNames 'personView'"
    };
    prerequisites[] = {};
    reward = 50;
};

class TaskQuickBuy: WLTaskTutorialUiMechanics {
    name = "Quick Buy Menu";
    description = "All items in the buy menu can also be activated via the quick buy shortcut. First, find the number of the category. Then, the number of the item. Combine these two to get the item. For example, to buy a quad bike, enter the buy menu by holding %1, then press 2, 1. For this task, quick buy anything.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskThirdPerson"
    };
    reward = 50;
};

class TaskQuickBuyShortcut: WLTaskTutorialUiMechanics {
    name = "Quick Buy Shortcut";
    description = "You can also use the quick buy shortcut to begin activating the quick buy menu. The shortcut key for this is Numpad Slash (/), or you can customize the Custom Action 5 key in your keybindings. You can cancel quick buy by using the backspace key. Activate the quick buy menu using the shortcut.";
    prerequisites[] = {
        "TaskQuickBuy"
    };
    reward = 50;
};

class TaskEarplugs: WLTaskTutorialUiMechanics {
    name = "Earplugs";
    description = "You can toggle earplugs by pressing INSERT. Earplugs are useful for reducing the game volume while in loud environments. Activate it now.";
    prerequisites[] = {
        "TaskQuickBuyShortcut"
    };
    reward = 50;
};

class TaskMapPing: WLTaskTutorialUiMechanics {
    name = "Map Ping";
    description = "You can ping the map by pressing %1. This will place a temporary ping marker on the map for all players to see, and pinged enemies will reward you with spot assist points if they are killed. Ping something now.";
    args[] = {
        "actionKeysNames 'TacticalPing'"
    };
    prerequisites[] = {
        "TaskEarplugs"
    };
    reward = 50;
};

class TaskMapAssetControls: WLTaskTutorialUiMechanics {
    name = "Map Asset Controls";
    description = "You can access options on your asset by left clicking them on your map. Try deleting one of your assets from the map.";
    prerequisites[] = {
        "TaskMapPing",
        "TaskBuyQuad"
    };
    reward = 50;
};

class TaskMapSectorControls: WLTaskTutorialUiMechanics {
    name = "Map Sector Controls";
    description = "You can access options on a sector by left clicking it on your map. Try fast traveling to a friendly sector via the map.";
    prerequisites[] = {
        "TaskMapAssetControls",
        "TaskFastTravelSeized"
    };
    reward = 50;
};

class TaskCustomization: WLTaskTutorialUiMechanics {
    name = "Customization";
    description = "You can customize your loadout by using the Customization menu. You can access it by by using the asset buy menu (Hold %1 key) -> Gear -> Customization. At respawn, the game will automatically deduct the costs and equip you with your customized loadout. Open the customization menu to complete this task.";
    args[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskMapSectorControls"
    };
    reward = 50;
};

class TaskLoadDeployable: WLTaskTutorialUiMechanics {
    name = "Load Deployable";
    description = "You can load certain turrets and deployables into a flatbed truck by using the scroll wheel menu. Purchase a flatbed and load a turret onto it.";
    prerequisites[] = {
        "TaskCustomization"
    };
    reward = 200;
};

class TaskSlingload: WLTaskTutorialUiMechanics {
    name = "Slingload";
    description = "You can slingload turrets and deployables to certain helicopters by using the scroll wheel menu and using the Attach Deployable option. Purchase a helicopter and try to slingload something to it.";
    prerequisites[] = {
        "TaskLoadDeployable"
    };
    reward = 200;
};