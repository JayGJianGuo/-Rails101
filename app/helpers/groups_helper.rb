module GroupsHelper
  def render_group_form(group)
    simple_format(group.description)
  end
end
