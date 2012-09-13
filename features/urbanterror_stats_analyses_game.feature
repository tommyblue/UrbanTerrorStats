Feature: UrbanterrorStats analyses a game log and prints hit stats
    As UrbanTerrorStats
    I want to read a game log
    So that I can get stats of a game
    Scenario: Print stats
        Given A started game
        When I read at least a round
        Then I print the report
