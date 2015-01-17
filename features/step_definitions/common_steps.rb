Given(/^there's a post titled "(.*?)" with "(.*?)" content$/) do |title, content|
  @post = FactoryGirl.create(:post, title: title, content: content, tag_list: 'bdd, world')
end

And(/^the post has been published$/) do
  @post.publish!
end

And(/^I should see the "(.*?)" content$/) do |content|
  page.should have_content(content)
end

Then(/^I should see the "(.*?)" title$/) do |title|
  @post = Post.find_by_title(title)

  page.should have_content(@post.title)
end
