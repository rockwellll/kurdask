module MarkdownHelper
  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
    Rouge::Themes::Molokai.render(scope: '.highlight')
  end

  def markdown(text)
    render_options = {
        hard_wrap: true,
        link_attributes: { rel: 'nofollow' },
        prettify: true,
        filter_html: true
    }
    renderer = HTML.new(render_options)
    extras = {
        autolink: true,
        no_intra_emphasis: true,
        disable_indented_code_blocks: true,
        fenced_code_blocks: true,
        strikethrough: true,
        superscript: true,
        lax_spacing: true
    }

    markdown = Redcarpet::Markdown.new(renderer, extras)
    raw markdown.render(text)
  end

end
