//remove this later
hull_max = hull_max * 400;
shield_max = shield_max * 400;


hull = hull_max;
shield = shield_max;
movespeed = maxspeed;
security_level = security_level_initial;

if (race == "unsc")
{
    // Apply module bonuses if equipped
    if (ship_modules & MODULE_MAC) {
        applyModule(id, MODULE_MAC);
    }
    if (ship_modules & MODULE_HANGAR) {
        applyModule(id, MODULE_HANGAR);
    }
    
    // Apply skill bonuses if sufficient level
    broadsword = broadsword_max;
    broadsword_deploy_cd = broadsword_deploy_cd_max;
    longsword = longsword_max;
    longsword_deploy_cd = longsword_deploy_cd_max;
    pelican = pelican_max;
    pelican_deploy_cd = pelican_deploy_cd_max;
    mac_cooldown = mac_cooldown_max;
}
else
{
    banshee = banshee_max;
    banshee_deploy_cd = banshee_deploy_cd_max;
    seraph = seraph_max;
    seraph_deploy_cd = seraph_deploy_cd_max;
    phantom = phantom_max;
    phantom_deploy_cd = phantom_deploy_cd_max;
    energyprojector_cooldown = energyprojector_cooldown_max;
}

alarm[0] = findtarget_delay;

init = true;
