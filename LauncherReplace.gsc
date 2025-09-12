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
        weapons = self getweaponslistall();

        if (isarray(weapons))
        {
            for (j = 0; j < weapons.size; j++)
            {
                currentWeapon = weapons[j];

                if (isLauncher(currentWeapon) && currentWeapon != "stinger_mp")
                {
                    self takeweapon(currentWeapon);
                    self giveweapon("stinger_mp");

                    if (self getcurrentweapon() == currentWeapon)
                    {
                        primaries = self getweaponslistprimaries();
                        if (isdefined(primaries) && primaries.size > 0) {
                            self switchtoweapon(primaries[0]);
                        }
                    }
                }
            }
        }

        wait 1; 
    }
}

isLauncher(weapon)
{
    if (!isdefined(weapon))
        return false;

    
    launchers = ["rpg_mp", "xm25_mp", "m320_mp", "smaw_mp", "javelin_mp"];

    for (i = 0; i < launchers.size; i++)
    {
        if (weapon == launchers[i])
            return true;
    }
    return false;
}
