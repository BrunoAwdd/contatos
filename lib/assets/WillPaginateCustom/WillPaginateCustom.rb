require 'will_paginate/view_helpers/link_render'
module WillPaginateCustom
  class LinkRendererCustom < LinkRenderer
    def tag(name, value, attributes = {})
      string_attributes = attributes.inject('') do |attrs, pair|
        unless pair.last.nil?
          attrs << %( #{pair.first}="#{CGI::escapeHTML(pair.last.to_s)}")
        end
        attrs
      end
      "<#{name}#{string_attributes}>#{value}</#{name}>"
    end
  end
end