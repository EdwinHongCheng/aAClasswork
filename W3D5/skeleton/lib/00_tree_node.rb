class PolyTreeNode
    attr_reader :value, :parent, :children
    attr_writer :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        @parent = parent
        parent.children << self if parent
    end


end