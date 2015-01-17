And(/^I visit the post page$/) do
  visit post_path(@post)
end

Then(/^I should see comments box$/) do
  page.should have_content('Comments')
end

And(/^I should see new comment form$/) do
  page.should have_content('New comment')
end