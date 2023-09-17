Config = {
    Command = "deletepeds",                                                          -- Command To Remove Peds!
    PermissionAllowed = false,                                                       -- Should We Make The Command Available For Specific Group/Permission
    Permission = "group.god",                                                        -- Permission To Use Command If `PermissionAllowed` is true

    CoolDown = true,                                                                 -- Should We Use CoolDown For Commands? true or false
    CoolDownTime = 10,                                                               -- If `CoolDown` Is true, How Much Seconds Will Be Cooldown?

    DeadOnly = false,                                                                -- Should We Remove Dead Peds Only? true, false
    DelDriver = true,                                                                -- Should We Remove Driver Peds? true, false (IF DEADONLY IS SET TO FALSE)
    DelWalking = true,                                                               -- Should We Remove Walking Peds? true, false (IF DEADONLY IS SET TO FALSE)

    Distance = 100.0,                                                                -- Default Distance To Remove Peds If No Args Used In Command

    Retry = 3,                                                                       -- Number Of Retries If Deleting Peds Failed

    Notify = 'QBCore',                                                               -- Available Options: 'StandAlone', 'QBCore', 'Esx', 'OkOk', 'Ox'
}


Lang = {
    CoolDown = 'Command cooldown: ',
    NoPerm = 'You do not have perimission to do this',
    Retry = 'Failed to delete peds, retrying...',
    Failed = 'Failed to delete peds after ' ..Config.Retry.. ' retries',
    Deleted = 'Nearby peds successfully deleted',
}
