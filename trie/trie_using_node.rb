require 'set'

class TrieNode
  attr_accessor :children, :char, :end_of_word

  def initialize(char = '*')
    @children = Set.new
    @char = char
    @end_of_word = false
  end

  def add_child(node)
    @children << node
  end
end

class Trie
  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    node = @root
    word.each_char do |char|
      child_found, sub_node = include?(node, char)
      if child_found
        node = sub_node
      else
        new_node = TrieNode.new(char)
        node.add_child new_node
        node = new_node
      end
    end
    node.end_of_word = true
  end

  def search(word)
    node = @root
    word.each_char do |char|
      child_found, sub_node = include?(node, char)
      if child_found
        node = sub_node
      else
        return false
      end
    end
    node.end_of_word ? true : false
  end

  def starts_with(prefix)
    node = @root
    prefix.each_char do |char|
      child_found, sub_node = include? node, char
      if child_found
        node = sub_node
      else
        return false
      end
    end
    true
  end

  def include?(node, char)
    return false, nil if node.nil?

    node.children.each do |child|
      return true, child if child.char == char
    end
    [false, nil]
  end
end

# Your Trie object will be instantiated and called as such:
#

obj = Trie.new
obj.insert('apple')
obj.insert('app')

obj.insert('ant')
obj.insert('basket')
obj.insert('baseball')

puts obj.search('apple')
puts obj.search('ama')
puts obj.search('appl')
puts obj.search('app')

puts obj.starts_with('ap')
puts obj.starts_with('apl')
