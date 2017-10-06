# frozen_string_literal: true

def require_files(directory, file_name='*')
  lib_dir = File.expand_path('../../', File.dirname(__FILE__)).freeze
  Dir["#{lib_dir}/#{directory}/**/#{file_name}.rb"].each {|file| require file }
end
