require("starship"):setup()

require("gpg"):setup {
  default_recipient = "jonashahn1@gmx.net",
  delete_after = true,
}

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
