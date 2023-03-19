local status_ok, todo_comments= pcall(require, "todo-comments")
if not status_ok then
	return
end

todo_comments.setup {
  merge_keywords = true,
  keywords = {
    TODO = {
      icon = " ",
      color = "info",
      alt = { "XX" }
    },
  }
}
