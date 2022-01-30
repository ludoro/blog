module Jekyll
    class FootNoteTag < Liquid::Tag
  
      def initialize(tag_name, text, tokens)
        super
        @text = text.strip
      end
  
      def render(context)
        "<sup id='fnref-#{@text}' class='footnote-ref'><a href='#fn-#{@text}'>#{@text}</a></sup>"
      end
    end
  end
  
Liquid::Template.register_tag('fn', Jekyll::FootNoteTag)

module JekyllFeed
  class Generator < Jekyll::Generator
    safe true
    priority :lowest

    alias_method :old_generate, :generate

    def generate(site)
      if site.config["feed"]["disable"]
        Jekyll.logger.info "Jekyll Feed disabled"
      else
        old_generate(site)
      end
    end
  end
end
