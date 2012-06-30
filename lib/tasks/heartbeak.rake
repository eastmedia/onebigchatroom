#!/usr/bin/env ruby

namespace :heartbeat do
  desc "reaps old heartbeat records"
  task :reap => :environment do
     Heartbeat.old.delete(:all)
     puts "Deleted"
  end
end