# frozen_string_literal: true

# Quit miso
class QuitRoute < Route
  def matchers
    %w[quit bye later exit]
  end
end
