Feature: UrbanterrorStats analyses a game log and find a valid game
    As UrbanTerrorStats
    I want to read a game log
    So that I can find a game
    Scenario: Start analyse a game
        Given I have a valid game log
        And I start analysing it
        When I find a game
        Then I find players
