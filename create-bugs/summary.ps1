# Try to render some markdown as described here
# https://help.github.com/articles/basic-writing-and-formatting-syntax/

# Verify here
# https://jbt.github.io/markdown-editor/

$markdown=""

#region Lists
$markdown+=New-MDHeader "Lists"
$markdown+=New-MDHeader "Unordered" -Level 2
$markdown+=New-MDParagraph
$lines=@(
    "George Washington",
    "John Adams",
    "Thomas Jefferson"
)
$markdown+=New-MDList -Lines $lines -Style Unordered
$markdown
$markdown|clip
