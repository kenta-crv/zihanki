require 'net/http'
require 'nokogiri'
# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://xn--new351c2sh.net/"

SitemapGenerator::Sitemap.create do
  add "/" , changefreq: 'daily', priority: 1.0
  add "/lp" , changefreq: 'daily', priority: 0.8
  add "/asahi" , changefreq: 'daily', priority: 0.8
  add "/suntory" , changefreq: 'daily', priority: 0.8
  add "/cocacola" , changefreq: 'daily', priority: 0.8
  add "/dydo" , changefreq: 'daily', priority: 0.8
  add "/itoen" , changefreq: 'daily', priority: 0.8
  add "/kirin" , changefreq: 'daily', priority: 0.8
  add "/otsuka" , changefreq: 'daily', priority: 0.8

  # Column一覧ページ
  add "/columns", changefreq: 'daily', priority: 0.6

  # ---- Column詳細ページをdrafity.pro経由(xn--new351c2sh.net/columns)からスクレイピングして収集 ----
  column_codes = []
  page = 1

  loop do
    uri = URI("https://xn--new351c2sh.net/columns?page=#{page}")
    res = Net::HTTP.get_response(uri)
    break unless res.is_a?(Net::HTTPSuccess)

    doc = Nokogiri::HTML(res.body)
    links = doc.css('a[href^="/columns/"]').map { |a| a['href'] }
                .reject { |href| href == '/columns' }
                .map { |href| href.sub('/columns/', '') }

    break if links.empty?

    column_codes.concat(links)
    page += 1
    break if page > 100 # 安全装置(無限ループ防止)
  end

  column_codes.uniq.each do |code|
    add "/columns/#{code}",
        changefreq: 'weekly',
        priority: 0.5
  end
end