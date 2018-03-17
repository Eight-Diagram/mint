class Ast
  class Variable < Node
    getter value

    def initialize(@value : String,
                   @input : Data,
                   @from : Int32,
                   @to : Int32)
    end
  end
end
