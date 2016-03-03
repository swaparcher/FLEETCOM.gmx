var _x, _y, xx, yy, dx, dy, cx, cy, instance, first_instance;
var affects = argument0;

dx = 0;
dy = 0;
cx = 0;
cy = 0;

_x = x;
_y = y;
xx = x + lengthdir_x(maxrange, dir);
yy = y + lengthdir_y(maxrange, dir);

if (!instance_exists(parentid)) {instance_destroy();}

var selfid = id;

with (parentid) 
{
    first_instance = collision_line(x, y, xx, yy, affects, false, false);

    if (first_instance != noone)
    {
        dx = xx - x;
        dy = yy - y;
        while (abs(dx) >= 1 || abs(dy) >= 1) 
        {
            dx /= 2;
            dy /= 2;
            instance = collision_line(x, y, xx - dx, yy - dy, affects, true, true);
            if (instance != noone) 
            {
                first_instance = instance;
                xx -= dx;
                yy -= dy;
            }
        }
    }
    
    cx = xx - dx;
    cy = yy - (dy * 2);
    if (first_instance == selfid.target) {global.hits++;}
    if (first_instance != noone)
    {
        if (side != first_instance.side)
        {
            Damage_Unit(selfid.dmg_kinetic, selfid, first_instance, "kinetic");
            Damage_Unit(selfid.dmg_explosive, selfid, first_instance, "explosive");
            Damage_Unit(selfid.dmg_thermal, selfid, first_instance, "thermal");
        }
    }
        
    selfid.image_xscale = point_distance(x, y, cx, cy) / 256;
}