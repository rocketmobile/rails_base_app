namespace :cache do
  task :clear => :environment do
    puts "=> Clearning Rails cache..."
    Rake::Task["cache:stats"].invoke

    puts "\n `Rails.cache.clear` => " + Rails.cache.clear.to_s + "\n\n"
    # manually reset the stats, as clearing the cache doesn't do so
    Rails.cache.dalli.reset_stats if Rails.cache.respond_to? :dalli

    Rake::Task["cache:stats"].reenable
    Rake::Task["cache:stats"].invoke
  end

  task :stats => :environment do
    include ActionView::Helpers::NumberHelper
    puts "=> Rails cache stats:"
    if Rails.cache.respond_to? :stats
      Rails.cache.stats.each do |host, stats|
        utilization = ( stats['bytes'].to_f / stats['engine_maxbytes'].to_f ) * 100
        puts "   #{host}:"
        puts "   > items: #{stats['total_items']}"
        puts "   > utilization: #{number_to_human_size(stats['bytes'])} (~#{number_to_percentage(utilization, precision: 0)})"
        puts "   > evictions: #{stats['evictions']}"
      end
    else
      puts "   > unavailable from #{Rails.cache.class}"
    end
  end
end