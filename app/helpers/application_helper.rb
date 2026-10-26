module ApplicationHelper
  def default_meta_tags
    {
      site: "",
      title:"<%= yield(:title) | 自販機ねっと' %>",
      description: "初期費用とサブスク利用で自動販売機を設置・運用するなら『自販機ねっと』。仕入れから投函、運用までまとめてサポートします。",
      canonical: "#{request.base_url}#{request.path}",
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

  def google_analytics_enabled?
    !google_analytics_excluded_request?
  end

  def google_analytics_excluded_request?
    return true if google_analytics_management_path?

    google_analytics_admin_callback?
  end

  def google_analytics_management_path?
    segments = request.path.to_s.split("/").reject(&:blank?)
    return false if segments.empty?

    root = segments[0]
    child = segments[1].to_s
    return false if google_analytics_public_auth_path?(root, child)
    return false if root == "users" && child == "thanks"

    google_analytics_excluded_roots.include?(root)
  end

  def google_analytics_public_auth_path?(root, child)
    return false unless %w[admins clients users workers].include?(root)

    %w[sign_in sign_up password cancel confirmation unlock].include?(child)
  end

  def google_analytics_excluded_roots
    %w[
      dashboard admin admins call_batches customers calls
      dial_scripts dial_utterances dial_faqs dial_unknown_utterances
      sidekiq submissions form_submissions clients users
    ]
  end

  def google_analytics_admin_callback?
    filters = %i[
      authenticate_admin!
      check_admin
      authenticate_admin_or_client!
      authenticate_any!
      require_admin!
      authorize_client_record!
    ]
    controller.class._process_action_callbacks.any? do |callback|
      next false unless callback.kind == :before
      next false unless filters.include?(callback.filter)

      google_analytics_callback_applies?(callback)
    end
  rescue StandardError
    false
  end

  def google_analytics_callback_applies?(callback)
    ifs = Array(callback.instance_variable_get(:@if))
    unlesses = Array(callback.instance_variable_get(:@unless))
    ifs.all? { |condition| google_analytics_condition_met?(condition) } &&
      unlesses.none? { |condition| google_analytics_condition_met?(condition) }
  end

  def google_analytics_condition_met?(condition)
    case condition
    when Symbol, String
      controller.__send__(condition)
    when Proc
      condition.arity.zero? ? controller.instance_exec(&condition) : condition.call(controller)
    else
      true
    end
  end
end
