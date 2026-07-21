require 'net/http'
require 'nokogiri'

SitemapGenerator::Sitemap.default_host = "https://xn--new351c2sh.net"

SitemapGenerator::Sitemap.create do
  add "/", changefreq: 'daily', priority: 1.0
  add "/lp", changefreq: 'daily', priority: 0.8
  add "/asahi", changefreq: 'daily', priority: 0.8
  add "/suntory", changefreq: 'daily', priority: 0.8
  add "/cocacola", changefreq: 'daily', priority: 0.8
  add "/dydo", changefreq: 'daily', priority: 0.8
  add "/itoen", changefreq: 'daily', priority: 0.8
  add "/kirin", changefreq: 'daily', priority: 0.8
  add "/otsuka", changefreq: 'daily', priority: 0.8
  add "/food", changefreq: 'weekly', priority: 0.7
  add "/secondhand", changefreq: 'weekly', priority: 0.7
  add "/original", changefreq: 'weekly', priority: 0.7

  add "/columns", changefreq: 'daily', priority: 0.6

  column_codes = []
  page = 1

  begin
    loop do
      uri = URI("https://xn--new351c2sh.net/columns?page=#{page}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.open_timeout = 10
      http.read_timeout = 20
      res = http.request(Net::HTTP::Get.new(uri))
      break unless res.is_a?(Net::HTTPSuccess)

      doc = Nokogiri::HTML(res.body)
      links = doc.css('a[href*="/columns/"]').map { |a| a['href'] }
                  .map { |href| href.to_s.split('?').first }
                  .select { |href| href.match?(%r{/columns/[^/]+/?\z}) }
                  .map { |href| href.sub(%r{\A.*/columns/}, '').delete_suffix('/') }
                  .reject(&:blank?)

      break if links.empty?

      column_codes.concat(links)
      page += 1
      break if page > 100
    end
  rescue StandardError => e
    warn "[sitemap] columns scrape failed: #{e.class}: #{e.message}"
  end

  column_codes.uniq.each do |code|
    add "/columns/#{code}",
        changefreq: 'weekly',
        priority: 0.5
  end
end
