require_relative '../spec_helper'

module UrbanterrorStats
    describe Base do
        context "starting up" do
            before(:each) do
                @ut_stats = Base.new("spec/support/games.log")
            end

            it "should give an error if can't find the log file" do
                logfile = "unexistent_logfile.log"
                $stdout.should_receive(:puts).with("The logfile \"#{logfile}\" cannot be found")
                @ut_stats_err = Base.new(logfile)
            end

            it "should register the logfile if found" do
                @ut_stats.logfile.should_not be_nil
            end
        end

        context "finding a valid game" do
            before(:each) do
                @ut_stats = Base.new("spec/support/games.log")
            end

            it "should register a game if found" do
                @ut_stats.start
                @ut_stats.game.should be_true
            end

            it "should give an error if can't find a game" do
                logfile = "spec/support/invalid_game.log"
                $stdout.should_receive(:puts).with("A valid game cannot be found")
                @ut_stats_err = Base.new(logfile)
                @ut_stats_err.start
            end
        end

        context "finding players" do
            before(:each) do
                @ut_stats = Base.new("spec/support/games.log")
            end

            it "should find at least two players" do
                @ut_stats.start
                @ut_stats.players.size.should >= 2
            end

            it "should give an error if can't find at least two players" do
                logfile = "spec/support/invalid_players.log"
                $stdout.should_receive(:puts).with("Cannot find at least two players")
                @ut_stats_err = Base.new(logfile)
                @ut_stats_err.start
            end
        end

        context "register hits" do
            before(:each) do
                @ut_stats = Base.new("spec/support/games.log")
            end

            it "should find at least a round" do
                @ut_stats.start
                @ut_stats.rounds.should > 0
            end

            it "should give an error if can't find at least a round" do
                logfile = "spec/support/invalid_rounds.log"
                $stdout.should_receive(:puts).with("Cannot find rounds")
                @ut_stats_err = Base.new(logfile)
                @ut_stats_err.start
            end

            it "should find hits" do
                @ut_stats.start
                hits = 0
                @ut_stats.players.each_pair do |id, player|
                    hits += 1 if player[:hits].size > 0
                end
                hits.should > 0
            end
        end
    end
end
