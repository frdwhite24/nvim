local status_ok, rename = pcall(require, "inc_rename")
if not status_ok then
	return
end

rename.setup()
