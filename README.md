# UrbanterrorStats

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'urbanterror_stats'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install urbanterror_stats

## Usage

Enable log hits in your UrbanTerror server setting:

    seta g_loghits "1"

Print hit stats with the gem by the command:

    urbanterror_stats $PATH_TO_LOGFILE

Example:

    ### GAME STATS ###

    ~~ Stats for TommyBlue ~~
    Hits: 228
    -- LOCATIONS
      -- Kevlar: 156 (68%)
          -- Arms: 42 (18%)
          -- Helmet: 12 (5%)
          -- Legs: 18 (7%)
        -- WAPONS
          -- g36: 104 (45%)
          -- M4: 120 (52%)
          -- mp5k: 4 (1%)

        ~~ Stats for Gala ~~
        Hits: 202
        -- LOCATIONS
          -- Kevlar: 129 (63%)
          -- Legs: 33 (16%)
          -- Helmet: 8 (3%)
          -- Arms: 32 (15%)
        -- WAPONS
          -- g36: 202 (100%)

        ~~ Stats for Pl4StiK0 ~~
        Hits: 224
        -- LOCATIONS
          -- Arms: 40 (17%)
          -- Kevlar: 143 (63%)
          -- Legs: 29 (12%)
          -- Helmet: 12 (5%)
        -- WAPONS
          -- g36: 223 (99%)
          -- mp5k: 1 (0%)

        ~~ Stats for Landsraad ~~
        Hits: 277
        -- LOCATIONS
          -- Kevlar: 182 (65%)
          -- Arms: 47 (16%)
          -- Legs: 38 (13%)
          -- Helmet: 10 (3%)
        -- WAPONS
          -- g36: 201 (72%)
          -- M4: 76 (27%)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
