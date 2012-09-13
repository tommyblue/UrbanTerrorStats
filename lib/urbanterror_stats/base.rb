module UrbanterrorStats
    class Base
        attr_reader :logfile, :game, :players, :rounds

        def initialize(logfile = nil)
            @game = false
            @players = {}
            @rounds = 0
            if logfile and File.exists?(logfile)
                @logfile = logfile
            else
                puts "The logfile \"#{logfile}\" cannot be found"
            end
        end

        def start
            File.readlines(@logfile).each do |line|
                @game = true if line.match /\s*\d{1,2}:\d{1,2}\sInitGame.*/

                if @game
                    if res = line.match(/\s*\d{1,2}:\d{1,2}\sClientConnect:\s(\d*)/)
                        self.update_player(res[1].to_i)
                    end

                    if res = line.match(/\s*\d{1,2}:\d{1,2}\sClientUserinfo:\s(\d*)\s(.*)/)
                        values = res[2].split('\\')
                        values.shift
                        self.update_player(res[1].to_i, parse_attrs(values))
                    end

                    if res = line.match(/\s*\d{1,2}:\d{1,2}\sClientUserinfoChanged:\s(\d*)\sn\\(\w+)\\.*/)
                        self.update_player(res[1].to_i, {name: res[2]})
                    end

                    if @players.size >= 2
                        @rounds += 1 if line.match(/\s*\d{1,2}:\d{1,2}\sInitRound:\s.*/)
                    end

                    if @rounds > 0
                        if res = line.match(/\s*\d{1,2}:\d{1,2}\sHit:\s(\d+)\s(\d+)\s(\d+)\s(\d+).*/)
                            victim = res[1].to_i
                            attacker = res[2].to_i
                            location = res[3].to_i
                            weapon = res[4].to_i

                            add_hit(victim, attacker, location, weapon)
                        end
                    end
                end
            end
            unless @game
                puts "A valid game cannot be found"
                return false
            end
            if @players.size < 2
                puts "Cannot find at least two players"
                return false
            end
            if @rounds == 0
                puts "Cannot find rounds"
                return false
            end

            print_stats
        end

        def update_player(id, attributes = nil)
            unless player_exists?(id)
                @players[id.to_i] = {}
            end
            if attributes
                attributes.each_pair do |key, value|
                    @players[id.to_i][key.to_sym] = value
                end
            end
        end

        def player_exists?(id)
            @players[id.to_i] ? true : false
        end

        def parse_attrs(attrs)
            ret = {}
            while pair = attrs.slice!(0,2)
                if pair.size == 2
                    ret[pair[0].to_sym] = pair[1]
                else
                    break
                end
            end
            return ret
        end

        def add_hit(victim, attacker, location, weapon)
            @players[attacker][:hits] = [] unless @players[attacker].has_key?(:hits)
            @players[attacker][:hits] << { victim: victim, location: location, weapon: weapon }
        end

        def print_stats
            puts "\n\n### GAME STATS ###\n\n"
            @players.each_pair do |id, player|
                puts "~~ Stats for #{player[:name]} ~~"
                puts "Hits: #{player[:hits].size}"

                locations = {}
                weapons = {}
                player[:hits].each do |hit|
                    locations[hit[:location]] = 0 unless locations[hit[:location]]
                    locations[hit[:location]] += 1

                    weapons[hit[:weapon]] = 0 unless weapons[hit[:weapon]]
                    weapons[hit[:weapon]] += 1

                end

                puts "-- LOCATIONS"
                locations.each_pair do |id, location|
                    puts "  -- #{LOCATIONS[id]}: #{location} (#{(location.to_i*100/player[:hits].size).to_i}%)"
                end

                puts "-- WAPONS"
                weapons.each_pair do |id, weapon|
                    puts "  -- #{WEAPONS[id]}: #{weapon} (#{(weapon.to_i*100/player[:hits].size).to_i}%)"
                end

                puts
            end
        end
    end
end
