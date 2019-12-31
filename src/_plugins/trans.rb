module Jekyll
  class Translate < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end

    def render(context)
      site = context.registers[:site]
      lang = site.config['lang']
      filename = "./_i18n/#{lang}.json"

      return @text if !File.exists?(filename)

      file = File.open(filename)
      json = JSON.load(file)
      json[@text] || @text
    end
  end
end

Liquid::Template.register_tag('trans', Jekyll::Translate)
