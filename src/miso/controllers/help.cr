require "../mvc/controller"
require "../miso_router"

# For when you just don't know how to phrase it
class HelpController < Controller
  def action
    render(
      view_cls: HelpMessageView,
      hash_context: {
        "descriptions" => descriptions
      }
    )
  end

  private def descriptions
    routes = MisoRouter.new(@prefs)._routes
    description_map = {} of String => String
    routes.map do |route|
      name = route.primary_match
      unless name.is_a?(Nil)
        description_map[name] = route.description
      end
    end
    description_map
  end
end
