Given /^a location exists with an associated borough$/ do
  borough = Borough.create(name:"manhattan")
  @location = Location.create(address:"123 Elm", borough:borough)
end

When /^I select a borough$/ do
  visit root_path
  click_link("manhattan")
end

When /^I search for the location by address$/ do
  fill_in 'location_address', with:@location.address
  click_on "Search Locations"
end

Then /^I should be taken to the location status details page$/ do
  page.should have_content @location.address
end
