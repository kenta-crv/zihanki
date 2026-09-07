module TopHelper
  FEATURED_COLUMNS = {
    top: [
      { title: "自販機設置にかかる費用はいくら？初期費用・維持費完全解説", path: "/columns/vending-machine-costs" },
      { title: "自販機の電気代はいくら？維持費を抑えて利益を残す方法", path: "/columns/vending-machine-electricity-cost" },
      { title: "自販機オーナーの利益率は？売上・年収・収益構造を徹底解説", path: "/columns/vending-machine-profit-margin" },
      { title: "故障・売上低下を防ぐ｜自動販売機メンテナンス完全ガイド", path: "/columns/vending-machine-maintenance-guide" },
      { title: "キャッシュレス対応自販機の導入方法｜売上アップを実現する最新戦略", path: "/columns/cashless-vending-machine-introduction" }
    ],
    secondhand: [
      { title: "副業で始める自販機ビジネス｜初心者でも収益化できる運営方法", path: "/columns/vending-machine-business" },
      { title: "自販機オーナーの利益率は？売上・年収・収益構造を徹底解説", path: "/columns/vending-machine-profit-margin" },
      { title: "自販機設置にかかる費用はいくら？初期費用・維持費完全解説", path: "/columns/vending-machine-costs" },
      { title: "故障・売上低下を防ぐ｜自動販売機メンテナンス完全ガイド", path: "/columns/vending-machine-maintenance-guide" },
      { title: "自販機の電気代はいくら？維持費を抑えて利益を残す方法", path: "/columns/vending-machine-electricity-cost" }
    ],
    food: [
      { title: "副業で始める自販機ビジネス｜初心者でも収益化できる運営方法", path: "/columns/vending-machine-business" },
      { title: "自販機設置にかかる費用はいくら？初期費用・維持費完全解説", path: "/columns/vending-machine-costs" },
      { title: "故障・売上低下を防ぐ｜自動販売機メンテナンス完全ガイド", path: "/columns/vending-machine-maintenance-guide" },
      { title: "自販機オーナーの利益率は？売上・年収・収益構造を徹底解説", path: "/columns/vending-machine-profit-margin" },
      { title: "キャッシュレス対応自販機の導入方法｜売上アップを実現する最新戦略", path: "/columns/cashless-vending-machine-introduction" }
    ]
  }.freeze

  LP_BREADCRUMB_LABELS = {
    "lp" => "自動販売機設置",
    "asahi" => "アサヒ自動販売機",
    "suntory" => "サントリー自動販売機",
    "cocacola" => "コカコーラ自動販売機",
    "itoen" => "伊藤園自動販売機",
    "dydo" => "ダイドー自動販売機",
    "kirin" => "キリン自動販売機",
    "otsuka" => "大塚自動販売機",
    "food" => "冷凍食品自動販売機",
    "secondhand" => "中古自動販売機",
    "original" => "協賛型自動販売機",
    "columns" => "お役立ち記事",
    "business" => "事業内容",
    "corporation" => "会社概要",
    "privacy" => "プライバシーポリシー",
    "faq" => "よくある質問"
  }.freeze

  def featured_columns_for(page_key = :top)
    FEATURED_COLUMNS[page_key.to_sym] || FEATURED_COLUMNS[:top]
  end

  # top#index のFAQと同一内容（JSON-LD用）
  def lp_faqs
    [
      { cat: "service", q: "お酒の自動販売機を設置したいけど提供してもらえますか？", a: "お酒の自動販売機は購入・自己運営の形となり、資格も必要なため、当社ではご案内対象外とさせていただいております。" },
      { cat: "service", q: "お菓子の自動販売機を設置できますか？", a: "お菓子の自動販売機は取り扱いがありません。ただしダイドードリンコに限り、カロリーメイト系をドリンク自販機と一緒に設置できる場合があります。" },
      { cat: "service", q: "電子マネー付きの自動販売機の設置はできますか？", a: "可能です。ただしメーカーによっては売上見込みが条件となるため、基準はお問い合わせください。" },
      { cat: "service", q: "今ある自動販売機が売れ行き不振で撤去されてしまった。代替え自動販売機を置いてもらえますか？", a: "月の販売本数が100本を下回る場合、他メーカーでも設置は難しいです。100本以上であれば入れ替えで設置基準を満たす場合もあるため、一度お問い合わせください。" },
      { cat: "install", q: "自動販売機を設置したいところに電源がない場合、自分で負担しなければいけないのでしょうか？", a: "自動販売機を設置する場所に電源がない場合、電源を引っ張ってくる電気工事が必要となります。多くのメーカーは電気工事費も負担してくれる場合が多いですが、想定売上が低いと判断される場合はお客様実費となることがあります。" },
      { cat: "install", q: "自動販売機は月間何本以上売れれば設置ができるの？", a: "メーカーにより基準は異なりますが、最低ラインとしておおよそ月間150本以上の売上が見込める場合に設置が検討されます。" },
      { cat: "install", q: "現場工事場所に設置をしたいが、何ヶ月以上工期が残っていれば設置ができる？", a: "現場工事場所への設置は、最低でも工期が10ヶ月以上残っていることが条件です。これを下回る場合、現在設置可能なメーカーはありません。" },
      { cat: "install", q: "狭いスペースでも自動販売機の設置は可能でしょうか？", a: "メーカーにより細型・スリム型を提供している場合があり、狭いスペースでも設置可能なことがあります。" },
      { cat: "pricing", q: "設置まで費用がかからないって本当？", a: "はい。自販機ねっとのご利用から見積もり・現地調査・設置までお客様費用はいただいておりません。ただし電源がなくメーカーが電気工事をお断りする場合は、お客様手配となることがあります。" },
      { cat: "pricing", q: "自動販売機の電気代はいくらくらいでしょうか？", a: "機種により大きく異なります。省エネタイプは月1,500〜2,000円程度、それ以外は3,000〜4,000円程度が目安です。" }
    ]
  end

  def rn_faq_categories
    [
      ["service", "サービスについて", "headset"],
      ["install", "設置条件", "pin"],
      ["pricing", "料金・費用", "yen"]
    ]
  end

  def rn_icon(name, html_class: "rn-icon")
    inner = rn_icon_paths[name.to_s]
    raise ArgumentError, "unknown renewal icon: #{name}" if inner.blank?

    %(<svg class="#{html_class}" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">#{inner}</svg>).html_safe
  end

  def rn_logo(html_class: "rn-logo-mark")
    %(
      <svg class="#{html_class}" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
        <polygon points="24,3 43,13.5 43,34.5 24,45 5,34.5 5,13.5" fill="#2563eb"/>
        <polygon points="24,13 35,19.2 35,31.8 24,38 13,31.8 13,19.2" fill="none" stroke="#fff" stroke-width="2.2"/>
        <circle cx="24" cy="25.5" r="3.1" fill="#fff"/>
      </svg>
    ).html_safe
  end

  private

  def rn_icon_paths
    @rn_icon_paths ||= {
      "headset" => '<path d="M4 13a8 8 0 0 1 16 0" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/><rect x="3" y="12" width="4.5" height="7" rx="2" stroke="currentColor" stroke-width="1.8"/><rect x="16.5" y="12" width="4.5" height="7" rx="2" stroke="currentColor" stroke-width="1.8"/><path d="M20.5 17.5v1.2A3.3 3.3 0 0 1 17.2 22H15" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>',
      "mail" => '<rect x="3" y="5.5" width="18" height="13" rx="2" stroke="currentColor" stroke-width="1.8"/><path d="M4 7l8 6 8-6" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>',
      "box" => '<path d="M3.5 7.5 12 3.5l8.5 4L12 11.5 3.5 7.5z" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/><path d="M3.5 7.5V16L12 20.5V11.5M20.5 7.5V16L12 20.5" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/>',
      "refresh-box" => '<path d="M4 8.2 12 4.5l8 3.7v8.3L12 20 4 16.5V8.2z" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"/><path d="M9 12.2a3 3 0 0 1 5.2-1.5M15 11.8a3 3 0 0 1-5.2 1.6" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/><path d="M14.6 8.8v2.3h2.3M9.4 15.3v-2.3H7.1" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/>',
      "chart" => '<path d="M4 19h16" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/><path d="M7 16v-5M12 16V8M17 16v-8" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/><path d="M7 9l5-3 5 2" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>',
      "shield" => '<path d="M12 3.5 19.5 6v5.2c0 4.4-3 7.6-7.5 9.3C7.5 18.8 4.5 15.6 4.5 11.2V6L12 3.5z" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/><path d="M9 12.2l2.1 2.1L15.5 10" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>',
      "gear" => '<circle cx="12" cy="12" r="3.1" stroke="currentColor" stroke-width="1.8"/><path d="M12 3.5v2.2M12 18.3v2.2M3.5 12h2.2M18.3 12h2.2M6 6l1.6 1.6M16.4 16.4 18 18M18 6l-1.6 1.6M7.6 16.4 6 18" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>',
      "heart-hands" => '<path d="M12 20s-7-4.2-7-9.2A3.8 3.8 0 0 1 12 8.2a3.8 3.8 0 0 1 7 2.6C19 15.8 12 20 12 20z" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"/><path d="M3.5 16.5c2.2 1.3 4.6 2 8.5 2s6.3-.7 8.5-2" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/>',
      "yen" => '<circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="1.8"/><path d="M8.2 7.8 12 12.2 15.8 7.8M12 12.2V17M8.8 12.2h6.4M8.8 14.6h6.4" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"/>',
      "cart" => '<path d="M4 5.5h2.2l1.4 9.2h10.2l1.6-6.4H7.2" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/><circle cx="9.2" cy="18.2" r="1.3" fill="currentColor"/><circle cx="16.6" cy="18.2" r="1.3" fill="currentColor"/>',
      "pin" => '<path d="M12 21s6.5-5.2 6.5-10.2A6.5 6.5 0 0 0 5.5 10.8C5.5 15.8 12 21 12 21z" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/><circle cx="12" cy="10.5" r="2.2" stroke="currentColor" stroke-width="1.8"/>',
      "sliders" => '<path d="M4 7h16M4 12h16M4 17h16" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/><circle cx="9" cy="7" r="2.1" fill="currentColor"/><circle cx="15" cy="12" r="2.1" fill="currentColor"/><circle cx="11" cy="17" r="2.1" fill="currentColor"/>',
      "building" => '<rect x="5" y="4" width="14" height="16" rx="1.2" stroke="currentColor" stroke-width="1.8"/><path d="M8 8h2M14 8h2M8 12h2M14 12h2M11 20v-4h2v4" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/>',
      "person" => '<circle cx="12" cy="8" r="3.1" stroke="currentColor" stroke-width="1.8"/><path d="M5.5 19c1.2-3.4 3.4-5 6.5-5s5.3 1.6 6.5 5" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>',
      "check" => '<circle cx="12" cy="12" r="9" fill="currentColor"/><path d="M8 12.2l2.6 2.6L16.2 9.4" stroke="#fff" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round"/>',
      "minus" => '<circle cx="12" cy="12" r="9" fill="currentColor"/><path d="M8 12h8" stroke="#fff" stroke-width="1.9" stroke-linecap="round"/>',
      "warn" => '<path d="M12 4.2 21 19.5H3L12 4.2z" fill="currentColor"/><path d="M12 10v4.2" stroke="#fff" stroke-width="1.8" stroke-linecap="round"/><circle cx="12" cy="16.6" r="1" fill="#fff"/>',
      "bullseye" => '<circle cx="12" cy="12" r="8.2" stroke="currentColor" stroke-width="1.8"/><circle cx="12" cy="12" r="4.4" stroke="currentColor" stroke-width="1.8"/><circle cx="12" cy="12" r="1.6" fill="currentColor"/>',
      "truck" => '<path d="M3 15V8.5h11V15M14 11h4.2l2.8 3.2V15H14" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/><circle cx="7.2" cy="16.7" r="1.6" stroke="currentColor" stroke-width="1.6"/><circle cx="17.2" cy="16.7" r="1.6" stroke="currentColor" stroke-width="1.6"/><path d="M3 15h11" stroke="currentColor" stroke-width="1.8"/>',
      "calendar" => '<rect x="3.5" y="5.5" width="17" height="15" rx="2" stroke="currentColor" stroke-width="1.8"/><path d="M8 3.8v3.2M16 3.8v3.2M3.5 10h17" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/><path d="M9 14.2l2 2 4.2-4.2" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>',
      "clipboard" => '<rect x="6" y="4.5" width="12" height="16" rx="2" stroke="currentColor" stroke-width="1.8"/><rect x="9" y="2.8" width="6" height="3.2" rx="1" stroke="currentColor" stroke-width="1.6"/><path d="M9 11h6M9 14.5h6" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/>',
      "phone" => '<rect x="7" y="3" width="10" height="18" rx="2.2" stroke="currentColor" stroke-width="1.8"/><path d="M10.5 6h3" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/><circle cx="12" cy="17.5" r="1" fill="currentColor"/>',
      "wifi" => '<path d="M5 10.2a10 10 0 0 1 14 0M7.6 13a6.4 6.4 0 0 1 8.8 0" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/><circle cx="12" cy="17.4" r="1.4" fill="currentColor"/>',
      "bell" => '<path d="M6.5 16.5h11c-.4-1.5-.8-3.3-.8-5.1A4.7 4.7 0 0 0 12 6.6a4.7 4.7 0 0 0-4.7 4.8c0 1.8-.4 3.6-.8 5.1z" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/><path d="M10 18.6a2 2 0 0 0 4 0" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>',
      "star" => '<path d="M12 3.6l2.3 4.8 5.3.7-3.8 3.7.9 5.2L12 15.8 7.3 18l.9-5.2L4.4 9.1l5.3-.7L12 3.6z" fill="currentColor"/>',
      "sparkle" => '<path d="M12 3.5 13.4 9 19 10.5 13.4 12 12 17.5 10.6 12 5 10.5 10.6 9 12 3.5z" fill="currentColor"/>',
      "chevron" => '<path d="M9 6l6 6-6 6" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round"/>',
      "cube" => '<path d="M12 3.4 20.2 8v8L12 20.6 3.8 16V8L12 3.4z" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/><path d="M12 20.6V11.2M20.2 8 12 11.2 3.8 8" stroke="currentColor" stroke-width="1.8"/>',
      "doc-x" => '<rect x="6" y="3.5" width="11" height="17" rx="1.6" stroke="currentColor" stroke-width="1.8"/><path d="M9 9.5h5M9 13h5" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/><circle cx="17.2" cy="17.2" r="3.3" fill="currentColor"/><path d="M16 16l2.4 2.4M18.4 16 16 18.4" stroke="#fff" stroke-width="1.5" stroke-linecap="round"/>',
      "people" => '<circle cx="9" cy="8" r="2.4" stroke="currentColor" stroke-width="1.7"/><circle cx="16" cy="8.5" r="2.1" stroke="currentColor" stroke-width="1.7"/><path d="M4.6 17.8c.7-2.8 2.3-4.2 4.4-4.2s3.7 1.4 4.4 4.2M13.2 13.8c1.6-.3 3.1.6 3.8 2.9" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/>',
      "question" => '<path d="M6 10.5c0-4 3.8-6.8 8.2-5.6 2.6.7 4.3 3 4.3 5.6 0 2.6-2 4.2-4.3 5.1v1.2" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/><circle cx="14" cy="19.2" r="1.1" fill="currentColor"/>',
      "factory" => '<path d="M3.5 19.5h17M5 19.5V11l4 2.5V11l4 2.5V8.5h6.5v11" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/><path d="M16.5 6.5v2M18.5 5v3.5" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>',
      "train" => '<rect x="5" y="7" width="14" height="9" rx="2" stroke="currentColor" stroke-width="1.8"/><path d="M8 16.5 6 20M16 16.5l2 3.5M8 11h8" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/><circle cx="9" cy="14.3" r="0.9" fill="currentColor"/><circle cx="15" cy="14.3" r="0.9" fill="currentColor"/>',
      "cloud" => '<path d="M8 17h9.2A3.8 3.8 0 0 0 17.5 9.6 5 5 0 0 0 8.2 10.4 3.6 3.6 0 0 0 8 17z" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/>',
      "exclaim" => '<circle cx="12" cy="12" r="9" fill="currentColor"/><path d="M12 7.4v5.4" stroke="#fff" stroke-width="1.9" stroke-linecap="round"/><circle cx="12" cy="16.4" r="1" fill="#fff"/>',
      "quote" => '<path d="M6 16.5c0-4.2 2.4-7 6-8.3" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/><circle cx="7.5" cy="16.2" r="2.3" fill="currentColor"/><path d="M14 16.5c0-4.2 2.4-7 6-8.3" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/><circle cx="15.5" cy="16.2" r="2.3" fill="currentColor"/>',
      "link-ext" => '<path d="M14 6h4.5V10.5M18.5 6l-8 8" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/><path d="M11 7H7.5A2.5 2.5 0 0 0 5 9.5v7A2.5 2.5 0 0 0 7.5 19h7a2.5 2.5 0 0 0 2.5-2.5V13" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>',
      "inbox" => '<path d="M4 13.5 6.2 5.8h11.6L20 13.5v5.2H4v-5.2z" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/><path d="M4 13.5h5.2l1 2h3.6l1-2H20" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/>',
      "speech-star" => '<path d="M5 5.5h14v10.2H9.5L5 19V5.5z" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/><path d="M12 8.2l.7 1.5 1.6.2-1.2 1.1.3 1.6L12 11.8l-1.4.8.3-1.6-1.2-1.1 1.6-.2L12 8.2z" fill="currentColor"/>'
    }
  end
end

