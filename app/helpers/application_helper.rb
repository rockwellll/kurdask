module ApplicationHelper
  # class MarkdownParser
  #   require 'redcarpet'
  #
  #   def initialize(markdown)
  #     @markdown = markdown
  #   end
  #
  #   def markdown_to_html
  #     processor.render(@markdown).html_safe
  #   end
  #
  #   def processor
  #     Redcarpet::Markdown.new(renderer, extensions = {})
  #   end
  #
  #   def renderer
  #     RougeRenderer.new(render_options = {})
  #   end
  # end
  #
  # class RougeRenderer < Redcarpet::Render::HTML
  #   require 'rouge'
  #   require 'rouge/plugins/redcarpet'
  #
  #   include Rouge::Plugins::Redcarpet
  # end

  include MarkdownHelper

  # def markdown(text)
  #   options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks]
  #   Markdown.new(text, *options).to_html.html_safe
  # end
end
