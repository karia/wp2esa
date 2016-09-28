require 'esa'
require 'rss'
require 'reverse_markdown'

module Wp2esa
  class Core
    def parse(xmr)
      rss = RSS::Parser.parse(xmr, false)

      rss.items.map do |item|
        {
          title: item.title,
          pubDate: item.pubDate,
          link: item.link,
          categories: item.categories.map(&:content),
          content_encoded: item.content_encoded
        }
      end
    end

    def post(parsed_items, token, team)
      client = Esa::Client.new(access_token: token, current_team: team)

      parsed_items.each do |item|
        params = {
          name:     item[:title],
          category: 'wp2esa/' + item[:categories].join('/'),
          tags:     '',
          body_md:  ReverseMarkdown.convert(item[:content_encoded]),
          wip:      true
        }
        puts params
        client.create_post(params)
        sleep 0.5
      end
    end
  end
end
