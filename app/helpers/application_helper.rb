module ApplicationHelper
  def default_meta_tags
    {
      site: "",
      title:"<%= yield(:title) | 自販機ねっと' %>",
      description: "自動販売機の一括比較見積もりなら『自販機ねっと』。条件の良い自販機会社を手軽に見積りできます。",
      charset: "UTF-8",
      reverse: true,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('favicon.ico'),  rel: 'apple-touch-icon' },
      ]
    }
  end

  def breadcrumb_list_json_ld
    return if !respond_to?(:breadcrumbs) || breadcrumbs.blank?

    items = breadcrumbs.each_with_index.map do |crumb, i|
      name = crumb.respond_to?(:name) ? crumb.name : crumb[:name] || crumb[:label]
      path = crumb.respond_to?(:path) ? crumb.path : crumb[:path]
      path = crumb.url if path.blank? && crumb.respond_to?(:url)

      item = {
        "@type" => "ListItem",
        "position" => i + 1,
        "name" => name
      }
      item["item"] = path.present? ? "#{request.base_url}#{path}" : request.original_url
      item
    end

    {
      "@context" => "https://schema.org",
      "@type" => "BreadcrumbList",
      "itemListElement" => items
    }.to_json
  end

  def organization_json_ld
    {
      "@context" => "https://schema.org",
      "@type" => "Organization",
      "name" => "自販機ねっと",
      "legalName" => "合同会社ファクトル",
      "url" => "https://自販機.net/",
      "logo" => "#{request.base_url}#{image_path('favicon.ico')}",
      "description" => default_meta_tags[:description],
      "address" => {
        "@type" => "PostalAddress",
        "streetAddress" => "中央新町12-13",
        "addressLocality" => "天草市",
        "addressRegion" => "熊本県",
        "postalCode" => "863-0023",
        "addressCountry" => "JP"
      }
    }.to_json
  end

  def website_json_ld
    {
      "@context" => "https://schema.org",
      "@type" => "WebSite",
      "name" => "自販機ねっと",
      "url" => "https://自販機.net/",
      "inLanguage" => "ja",
      "publisher" => {
        "@type" => "Organization",
        "name" => "合同会社ファクトル"
      }
    }.to_json
  end

  def faq_page_json_ld(items)
    entities = Array(items).filter_map do |item|
      q = (item.is_a?(Array) ? item[0] : (item[:q] || item["q"])).to_s.strip
      a = (item.is_a?(Array) ? item[1] : (item[:a] || item["a"])).to_s.strip
      next if q.blank? || a.blank?

      {
        "@type" => "Question",
        "name" => q,
        "acceptedAnswer" => {
          "@type" => "Answer",
          "text" => a
        }
      }
    end
    return if entities.blank?

    {
      "@context" => "https://schema.org",
      "@type" => "FAQPage",
      "mainEntity" => entities
    }.to_json
  end
end
