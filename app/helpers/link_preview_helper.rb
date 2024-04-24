require 'metainspector'

module LinkPreviewHelper
    def fetch_metadata(url)
      if url.present?
        begin
          page = MetaInspector.new(url)

          title = page.title
          description = page.description
          url = page.url
          image_url = page.meta['og:image']
          favicon_url = page.images.favicon

          { title: title,
            description: description,
            url: url,
            image_url: image_url,
            favicon_url: favicon_url }
        rescue StandardError => e
          Rails.logger.error "Error fetching metadata: #{e.message}"
          { title: 'Error', description: 'Failed to retrieve metadata', image_url: nil, favicon_url: nil }
        end
      end
    end
end