//T6

init_camo_speed_changer()
{
    level thread onPlayerConnect_handler();
}

onPlayerConnect_handler()
{
    for (;;)
    {
        level waittill( "connected", player );
        player thread camo_speed_controller();
    }
}

camo_speed_controller()
{
    self endon("disconnect");

    for (;;)
    {
        self waittill("gsc_use_button_pressed");

        current_weapon = self getcurrentweapon();
        
        if ( isDefined( current_weapon ) && (current_weapon getweaponcamo() == "camo_cybertron") )
        {
            current_speed = self getmaterialanimspeed("camo_cybertron_reveal_material");
            
            if ( current_speed < 2.0 )
            {
                self setmaterialanimspeed("camo_cybertron_reveal_material", 2.0);
            }
            else
            {
                self setmaterialanimspeed("camo_cybertron_reveal_material", 1.0);
            }
        }
        wait(0.5); 
    }
}
