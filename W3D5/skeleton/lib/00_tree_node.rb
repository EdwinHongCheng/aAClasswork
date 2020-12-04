class PolyTreeNode
    attr_reader :value, :parent, :children

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

        self.children.each do |child|
            child_result = child.dfs(target_value)
            return child_result if child_result != nil
        end

        nil
    end

    def bfs(target_value)

        queue = [self]

        until queue.length == 0
            first_node = queue.shift
            return first_node if first_node.value == target_value
            first_node.children.each { |child| queue << child }
        end

        nil
    end

end
