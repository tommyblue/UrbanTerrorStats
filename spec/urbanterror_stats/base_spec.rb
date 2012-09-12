require_relative '../spec_helper'

module UrbanterrorStats
    describe Base do
        context "starting up" do
            before(:each) do
                @ut_stats = Base.new("../../spec/support/games.log")
            end

            it "should give an error if can't find the log file" do
                $stdout.should_receive(:puts).with("The logfile cannot be found")
                @ut_stats_err = Base.new("unexistent_logfile.log")
            end

            it "should register the logfile if found" do
                @ut_stats.logfile should_not be_nil
            end
        end
    end
end
