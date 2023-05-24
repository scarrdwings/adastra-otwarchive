require 'resque'
require "/var/otwarchive-read-only/config/environment"

begin
  info=Resque.info
  sum=info[:working]+info[:pending]
  puts sum
  sleep 10
end while sum != 0
