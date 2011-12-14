module ShowFor
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy ShowFor installation files"
      source_root File.expand_path('../templates', __FILE__)

      def copy_initializers
        copy_file 'show_for.rb', 'config/initializers/show_for.rb'
      end

      def copy_locale_file
        copy_file 'en.yml', 'config/locales/show_for.en.yml'
      end

      def copy_generator_template
        copy_file 'show.html.erb', 'lib/templates/erb/scaffold/show.html.erb'
      end
    end
  end
end