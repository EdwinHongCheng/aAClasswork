class PolyTreeNode
    attr_reader :value, :parent, :children
    attr_writer :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)

        if @parent
            @parent.children.delete(self)
        end

        @parent = new_parent
        new_parent.children << self if new_parent
    end

    def add_child(child_node)
        child_node.parent = self
        self.children << child_node if !self.children.include?(child_node)
    end

    def remove_child(child_node)
        raise if child_node.parent == nil
        child_node.parent = nil
    end

    def dfs(target_value)

        return self if self.value == target_value
        return nil if self.children.empty?
        answer = nil

        self.children.each do |child|
            child_result = dfs(child)
            if child_result != nil
                answer = child_result
            end
        end

        answer
    end
end

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")

# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2

# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []