# frozen_string_literal: true

# Full text Seach the product in elastic search
module ProductSearch
  extend ActiveSupport::Concern

  included do
    searchkick word_start: %i[name description combined],
               highlight: %i[name description],
               suggest: %i[name description],
               callbacks: :async
  end

  def description_as_plaintext
    @description_as_plaintext ||= begin
      # Remove styles and get real text, don't just strip tags.
      # Based on https://stackoverflow.com/a/28449868/57950
      doc = Nokogiri::HTML(description)
      doc.xpath('//style').remove
      doc.xpath('//text()').map(&:text).map(&:strip).join(' ')
    end
  end

  def search_data
    {
      name:,
      description: description_as_plaintext,
      combined: "#{name} #{description_as_plaintext}"
    }
  end

  class_methods do
    def search_for(search_string, options = {})
      search search_string, **{
        fields: %i[name^10 description combined],
        match: :word_start, suggest: true,
        highlight: true, misspellings: false
      }.merge(options)
    end
  end
end
