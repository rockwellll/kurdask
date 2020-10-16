require 'redcarpet'

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

  # include MarkdownHelper

  # def markdown(text)
  #   options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks]
  #   Markdown.new(text, *options).to_html.html_safe
  # end
  #
  #
  class HT < Redcarpet::Render::HTML
    def block_code(code, lanuage)
      Pygments.highlight(code, lexer: lanuage)
    end
  end
  def markdown_v2(text)
    render_options = {
        hard_wrap: true,
        link_attributes: { rel: 'nofollow' },
        prettify: true,
        filter_html: true
    }
    renderer = HT.new(render_options)
    extras = {
        autolink: true,
        no_intra_emphasis: true,
        disable_indented_code_blocks: true,
        fenced_code_blocks: true,
        strikethrough: true,
        superscript: true,
        lax_spacing: true
    }

    Redcarpet::Markdown.new(renderer, extras).render(text).html_safe
  end
end
