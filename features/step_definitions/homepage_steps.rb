When(/^I visit the homepage$/) do
  visit root_path
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
