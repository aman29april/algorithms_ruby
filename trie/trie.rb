require 'pp'

# using just hash
class TrieUsingHash
  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    node = @root
    word.each_char do |char|
        if
      new_node = TrieNode.new char
      node.children << new_node
      node.char = char unless node.has_key? char
      node = node[char]
    end
    node[@end] = true
  end

  def search(word)
    node = @root
    word.each_char do |char|
      return false unless node.has_key? char

      node = node[char]
    end
    node[@end] == true
  end

  def starts_with(prefix)
    node = @root
    prefix.each_char do |char|
      return false unless node.has_key? char

      node = node[char]
    end
    true
  end
end


# Your Trie object will be instantiated and called as such:
#
word = 'apple'
prefix = 'ap'
obj = Trie.new
obj.insert(word)
obj.insert('app')

obj.insert('ant')
obj.insert('basket')
obj.insert('baseball')

puts obj.search(word)
puts obj.search('ama')
puts obj.search('appl')
puts obj.search('app')

puts obj.starts_with('ap')
puts obj.starts_with('apl')
