local status_ok, delaytrain = pcall(require, "delaytrain")
if not status_ok then
	return
end

delaytrain.setup()
