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
                
                
                if (currentOffHand != "smoke_grenade_mp")
                {
                    self takeweapon(currentOffHand);
                    self giveweapon("smoke_grenade_mp");
                }
            }
        }
        wait 1; 
    }

}
