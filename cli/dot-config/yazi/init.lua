require("starship"):setup()

require("gpg"):setup {
    default_recipient = "jonashahn1@gmx.net",
    delete_after = true,
}
 
require("git"):setup()

-- https://github.com/MasouShizuka/projects.yazi
require("projects"):setup({
    save = {
        method = "lua",
    },
    last = {
        update_after_save = true,
        update_after_load = true,
        load_after_start = true,
    },
    notify = {
        enable = false,
    },
})

function Linemode:line_info()
    local time = math.floor(self._file.cha.mtime or 0)
    if time == 0 then
        time = ""
    elseif os.date("%Y", time) == os.date("%Y") then
        time = os.date("%b %d %H:%M", time)
    else
        time = os.date("%b %d  %Y", time)
    end
    return time
end
