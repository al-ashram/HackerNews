class Post

attr_reader :title, :url, :points, :item_id

def initialize(doc)
  @doc = doc
  @title = doc.css("title").text
  @url = doc.css("head link")[0]["href"]
  @points = doc.css(".score").text
  @item_id = doc.css(".subtext a")[1]["href"]
  @comments_array ||= @doc.css("span .c00").map {|element| Comment.new(element.text)}
end

def comments
  #this displays array
  @comments_array
end

def add_comment(comment_object)
  @comments_array.push(comment_object)
end

end