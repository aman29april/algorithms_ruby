# https://leetcode.com/problems/simplify-path/submissions/
# n a Unix-style file system, a period '.' refers to the current directory, a double period '..' refers to the directory up a level, and any multiple consecutive slashes (i.e. '//') are treated as a single slash '/'. For this problem, any other format of periods such as '...' are treated as file/directory names.

# The canonical path should have the following format:

# The path starts with a single slash '/'.
# Any two directories are separated by a single slash '/'.
# The path does not end with a trailing '/'.
# The path only contains the directories on the path from the root directory to the target file or directory (i.e., no period '.' or double period '..')
# Return the simplified canonical path.
#

def simplify_path(path)
  return '' if path.empty?

  start_with_slash = path[0] == '/'
  stack = []
  stack << '' if start_with_slash
  tokens = path.split('/')
  tokens.each do |token|
    case token
    when '..'
      stack.pop if stack[-1] != ''

    when '.', ''
      next
    else
      stack.push token
    end
  end

  return '/' if stack.length == 1 && stack[0] == ''

  stack.join('/')
end

# "/home"
puts simplify_path('/home/').to_s

# "/"
puts simplify_path('/../').to_s

# "/home/foo"
puts simplify_path('/home//foo/').to_s

# "/foo/bar/baz"
puts simplify_path('/foo/../test/../test/../foo//bar/./baz').to_s
