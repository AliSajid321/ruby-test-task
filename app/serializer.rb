require_relative "post"
require_relative "comment"

$ARR = []
def attribute addr
    $ARR.push(addr)
end

class Serializer
    
    def initialize(obj)
        if obj.class == Comment
            @obj = Comment.new(obj.id, obj.body, obj.title)
        elsif obj.class == Post
            new_date = Date.parse(obj.date.to_s).strftime('%d-%m-%Y')
            @obj = Post.new(obj.id, obj.title, new_date)
        end
    end

    def serialize
        @serObject = Marshal.dump(@obj)
        @unserObject = Marshal.load(@serObject)
        if @obj.class == Post
            @obj_hash = @obj.to_h
        elsif @obj.class == Comment
            @obj_hash = @obj.to_h
            @obj_hash.tap {|hs| hs.delete(:title) }
        end

    end


end
