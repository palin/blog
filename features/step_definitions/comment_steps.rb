Then(/^I should see comment author input$/) do
  page.should have_css('.author_input')
end

And(/^I should see comment content input$/) do
  page.should have_css('.content_input')
end

And(/^I should see comment submit button$/) do
  page.should have_css("input[type=submit]")
end

When(/^I fill in author input with "(.*?)"$/) do |author|
  within('#new_comment') do
    fill_in('test-author', with: author)
  end
end

And(/^I fill in content input with "(.*?)"$/) do |content|
  within('#new_comment') do
    fill_in('test-content', with: content)
  end
end

And(/^I press submit button$/) do
  within('#new_comment') do
    page.find('.btn-primary').click
  end
end

Then(/^I should see the new comment with author "(.*?)"$/) do |author|
  within("#comments_section") do
    page.should have_content(author)
  end
end

And(/^I should see the new comment with content "(.*?)"$/) do |content|
  within("#comments_section") do
    page.should have_content(content)
  end
end

And(/^I should see the today's date$/) do
within("#comments_section") do
    page.should have_content(Date.today.strftime("%d/%m/%Y"))
  end
end