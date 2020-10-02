module ApplicationHelper
  class MarkdownParser
    require 'redcarpet'

    def initialize(markdown)
      @markdown = markdown
    end

    def markdown_to_html
      processor.render(@markdown).html_safe
    end

    def processor
      Redcarpet::Markdown.new(renderer, extensions = {})
    end

    def renderer
      RougeRenderer.new(render_options = {})
    end
  end

  class RougeRenderer < Redcarpet::Render::HTML
    require 'rouge'
    require 'rouge/plugins/redcarpet'

    include Rouge::Plugins::Redcarpet
  end
end
