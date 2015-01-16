Given(/^there's a post titled "(.*?)" with "(.*?)" content$/) do |title, content|
  @post = FactoryGirl.create(:post, title: title, content: content, tag_list: 'bdd, world')
end

And(/^the post has been published$/) do
  @post.publish!
end

When(/^I visit the homepage$/) do
  visit root_path
end

When(/^I visit the post page$/) do
  visit post_path(@post)
end

Then(/^I should see the "(.*?)" title$/) do |title|
  @post = Post.find_by_title(title)

  page.should have_content(@post.title)
end

And(/^I should see the date$/) do
  page.should have_content(@post.pretty_date)
end

And(/^I should see the "(.*?)" tag$/) do |tags|
  page.should have_content(tags)
end

And(/^I should see the read more button$/) do
  page.should have_content("READ MORE")
end

And(/^I should see the "(.*?)" content$/) do |content|
  page.should have_content(content)
end
