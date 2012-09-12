module UrbanterrorStats
    class Base
        attr_reader :logfile

        def initialize(logfile = nil)
            if logfile and File.exists?(logfile)
                @logfile = logfile
            else
                puts "The logfile \"#{logfile}\" cannot be found"
            end
        end
    end
end
