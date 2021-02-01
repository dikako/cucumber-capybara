Given (/client visit "(.*)"/) do |path|
  visit path.to_s
end

Then (/client must see title "(.*)"/) do |page_title|
  title = page.title
  expect(title).to eq(page_title)
end

When (/client click link text "(.*)"/) do |link_text|
  click_link(link_text.to_s)
end

Then (/client must see endpoint "(.*)"/) do |path|
  expect(page).to have_current_path(path)
end

When (/client fill in "(.*)" on element "(.*)"/) do |input, element|
    Helper.resolve_env(self, input)
    fill_in(element, :with => input)
end

When (/client click button "(.*)"/) do |element|
    click_button(element)
end 

Then (/client must see text "(.*)"/) do |text|
    expect(page).to have_content(text)
end
