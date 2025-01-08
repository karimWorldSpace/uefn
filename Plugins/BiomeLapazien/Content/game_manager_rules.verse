
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /Fortnite.com/Characters }
using { /Verse.org/Random }
using { /Verse.org }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
game_manager_rules := class(creative_device):

    @editable
    var SpawnList : []teleporter_device =  array{}

    @editable
    var MyTrigger: trigger_device = trigger_device{}

    @editable
    var ListItemForSlot1: []item_granter_device = array{}

    @editable
    var ListItemForSlot2: []item_granter_device = array{}

    @editable
    var ListItemForSlot3: []item_granter_device = array{}

    @editable
    var ListItemForSlot4: []item_granter_device = array{}

    @editable
    var ListItemForSlot5: []item_granter_device = array{}

    @editable
    var PlayerTrackers: []player_reference_device = array{}

    var randomSlot1 : int = 0
    var randomSlot2 : int = 0
    var randomSlot3 : int = 0
    var randomSlot4 : int = 0
    var randomSlot5 : int = 0

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        Print("OnBegin game_manager_rules")
        #Sleep(3.0)
        AllPlayers := GetPlayspace().GetPlayers()
        var randomized: []teleporter_device = Shuffle(SpawnList) 
        var countArray : int = randomized.Length
        
        Print("Jattends que ca trigger pour les tp")
       # MyTrigger.TriggeredEvento.Await()

        Print("je tp les gens")
        #for (Index := 0..AllPlayers.Length - 1):
         #   if (Element := AllPlayers[Index]):
          #     if(SpawnZone := randomized[Index]):
           #         SpawnZone.Teleport(Element)
        
        
        for (Index := 0..AllPlayers.Length - 1):
            Print("je leur donne du stuff randomized")
            set randomSlot1 = GetRandomInt(0, ListItemForSlot1.Length-1)
            set randomSlot2 = GetRandomInt(0, ListItemForSlot2.Length-1)
            set randomSlot3 = GetRandomInt(0, ListItemForSlot3.Length-1)
            set randomSlot4 = GetRandomInt(0, ListItemForSlot4.Length-1)
            set randomSlot5 = GetRandomInt(0, ListItemForSlot5.Length-1)
            if (Player := AllPlayers[Index]):
                if(Item1 := ListItemForSlot1[randomSlot1]):
                    Item1.GrantItem(Player)
                if(Item2 := ListItemForSlot2[randomSlot2]):
                    Item2.GrantItem(Player)
                if(Item3 := ListItemForSlot3[randomSlot3]):
                    Item3.GrantItem(Player)
                if(Item4 := ListItemForSlot4[randomSlot4]):
                    Item4.GrantItem(Player)
                if(Item5 := ListItemForSlot5[randomSlot5]):
                    Item5.GrantItem(Player)
                
        
        
        


            

    
