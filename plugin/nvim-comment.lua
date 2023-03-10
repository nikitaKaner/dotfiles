local status, comment = pcall(require, 'nvim_comment')
if not status then return end

comment.setup {
  line_mapping = 'gcc',
  operator_mapping = 'gc',
  comment_empty = false,
  comment_empty_trim_spaces = true,
}
