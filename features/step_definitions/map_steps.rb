# frozen_string_literal: true

When(/^I visit the state map for "([^"]*)"$/) do |state_symbol|
  visit state_map_path(state_symbol: state_symbol)
end

Given /the following states exist/ do |table|
  table.hashes.each do |state|
    State.create(state)
  end
end
