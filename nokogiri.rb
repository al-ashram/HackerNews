require 'nokogiri'
require_relative 'post'
require_relative 'comment'

doc = Nokogiri::HTML(File.open('post.html'))

def extract_usernames(doc)
  doc.search('.comhead > a:first-child').map do |element|
    element.inner_text
  end
end

#puts extract_usernames(doc)

#puts doc.search('.subtext > span:first-child').map { |span| span.inner_text}
#puts doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
#puts doc.search('.title > a:first-child').map { |link| link.inner_text}
#puts doc.search('.title > a:first-child').map { |link| link['href']}
#puts doc.search('.comment > font:first-child').map { |font| font.inner_text}


post = Post.new(doc)
# puts "TITLE: " + post.title
# puts "URL: " + post.url
# puts "SCORE: " + post.points.to_s
# puts "ID: " + post.item_id.gsub("item?id=", "")




comment = Comment.new("This is own comment!")


puts post.add_comment(comment)
puts post.comments


