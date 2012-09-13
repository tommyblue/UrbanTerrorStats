Feature: UrbanterrorStats opens the log file
    As UrbanTerrorStats
    I want to open the logfile
    So that I can analyze it
    Scenario: Start reading logfile
        Given I am started
        When I find the logfile
        Then I start analyzing the logfile
