#include maps\mp\_utility;
#include common_scripts\utility;

init()
{
    level thread onPlayerConnect();
}

onPlayerConnect()
{
    for (;;)
    {
        level waittill("connected", player);
        player thread manageLoadoutForever();
    }
}

manageLoadoutForever()
{
    self endon("disconnect");

    for (;;)
    {
        offHands = self getweaponslistoffhands();

        if (isarray(offHands))
        {
            for (j = 0; j < offHands.size; j++)
            {
                currentOffHand = offHands[j];
                
                // Check if the off-hand weapon is not a smoke grenade
                if (currentOffHand != "smoke_grenade_mp")
                {
                    self takeweapon(currentOffHand);
                    // You can optionally give them a smoke grenade here if you want to replace it
                    self giveweapon("smoke_grenade_mp");
                }
            }
        }
        wait 1; 
    }
}