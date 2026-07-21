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
end
