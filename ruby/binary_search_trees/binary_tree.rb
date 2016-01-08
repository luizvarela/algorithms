module BinaryTree
  def self.from_array(array)
    Node.new(array.first).tap do |tree|
      array.each { |v| tree.insert(v) }
    end
  end
 
  class Node
    attr_reader :value
    attr_accessor :left, :right

    def initialize(value)
      @value = value
      @left = EmptyNode.new
      @right = EmptyNode.new
    end

    def insert(v)
      case value <=> v
      when 1 then insert_left(v)
      when -1 then insert_right(v)
      when 0 then false
      end
    end

    def include?(v)
      case value <=> v
      when 1 then left.include?(v)
      when -1 then right.include?(v)
      when 0 then true
      end
    end

    def inspect
      "{#{value}::#{left.inspect}|#{right.inspect}}"
    end

    private

    def insert_left(value)
      left.insert(value) or self.left = Node.new(value)
    end

    def insert_right(value)
      right.insert(value) or self.right = Node.new(value)
    end
  end

  class EmptyNode
    def to_a
      []
    end

    def include?(*)
      false
    end

    def insert(*)
      false
    end

    def inspect
      "{}"
    end
  end
end
