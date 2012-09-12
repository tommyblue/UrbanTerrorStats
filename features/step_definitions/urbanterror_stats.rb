Given /^I am started$/ do
    @ut_stats = UrbanterrorStats::Base.new
end

When /^I find the logfile$/ do
    @ut_stats.logfile.should_not be_nil
end

Then /^I start analyzing the logfile$/ do
    @ut_stats.start
end

