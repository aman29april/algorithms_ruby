# gem install tty-tree
#
require 'tty-tree'
tree = TTY::Tree.new(Dir.pwd)
# puts tree.render

puts tree.render(as: :dir)
