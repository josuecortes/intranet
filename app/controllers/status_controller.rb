class StatusController < ApplicationController
  def index
  	
  	

		def ping(host)
		  begin
		    Timeout.timeout(5) do 
		      s = TCPSocket.new(host, 'echo')
		      s.close
		      return true
		    end
		  rescue Errno::ECONNREFUSED 
		    return true
		  rescue Timeout::Error, Errno::ENETUNREACH, Errno::EHOSTUNREACH
		    return false
		  end
		end

		@google = ping('172.217.28.35')
		puts "google"
		puts @google
		@siscom = ping('10.155.98.254')
		puts "siscom"
		puts @siscom
		
		  

  end
end
