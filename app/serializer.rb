
$ARR = []
def attribute addr
    $ARR.push(addr)
end

class Serializer
    
    def initialize(obj)
        if obj.class == Comment
            @obj = Comment.new(obj.id, obj.body, obj.title)
        elsif
            @obj = Post.new(obj.id, obj.title, obj.date)
        end
    end

end
