Given /^I am started$/ do
    @ut_stats = UrbanterrorStats::Base.new("spec/support/games.log")
end

When /^I find the logfile$/ do
    @ut_stats.logfile.should_not be_nil
end

Then /^I start analyzing the logfile$/ do
    @ut_stats.start
end

########

Given /^I have a valid game log$/ do
    @ut_stats = UrbanterrorStats::Base.new("spec/support/games.log")
    @ut_stats.logfile.should_not be_nil
end

Given /^I start analysing it$/ do
    @ut_stats.start
end

When /^I find a game$/ do
    @ut_stats.game.should be_true
end

Then /^I find players$/ do
    @ut_stats.players.size.should >= 2
end

########

Given /^A started game$/ do
    @ut_stats = UrbanterrorStats::Base.new("spec/support/games.log")
    @ut_stats.start
end

When /^I read at least a round$/ do
    @ut_stats.rounds.should > 0
end

Then /^I print the report$/ do
  pending # express the regexp above with the code you wish you had
end

