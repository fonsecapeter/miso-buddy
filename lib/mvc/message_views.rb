# frozen_string_literal: true

require 'mvc/utils/dynamic_loaders'

# Load all message views
module MessageViews
  require_files('views', '*_message_view')
end
