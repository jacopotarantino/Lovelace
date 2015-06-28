unless defined? Rails
  lovelace_ruby_lib_prefix = "#{ File.dirname( __FILE__ ) }/"
end

require "#{ lovelace_ruby_lib_prefix }lovelace-ruby/init.rb"
require "#{ lovelace_ruby_lib_prefix }lovelace-ruby/component.rb"
require "#{ lovelace_ruby_lib_prefix }lovelace-ruby/style.rb"
require "#{ lovelace_ruby_lib_prefix }lovelace-ruby/script.rb"
require "#{ lovelace_ruby_lib_prefix }lovelace-ruby/complete.rb"
require "#{ lovelace_ruby_lib_prefix }lovelace-ruby/styles.rb"
require "#{ lovelace_ruby_lib_prefix }lovelace-ruby/scripts.rb"
