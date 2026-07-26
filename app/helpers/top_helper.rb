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
      { q: "自動販売機を設置したいところに電源がない場合、自分で負担しなければいけないのでしょうか？", a: "自動販売機を設置する場所に電源がない場合、電源を引っ張ってくる電気工事が必要となります。多くのメーカーは電気工事費も負担してくれる場合が多いですが、想定売上が低いと判断される場合はお客様実費となることがあります。" },
      { q: "お酒の自動販売機を設置したいけど提供してもらえますか？", a: "お酒の自動販売機は購入・自己運営の形となり、資格も必要なため、当社ではご案内対象外とさせていただいております。" },
      { q: "設置まで費用がかからないって本当？", a: "はい。自販機ねっとのご利用から見積もり・現地調査・設置までお客様費用はいただいておりません。ただし電源がなくメーカーが電気工事をお断りする場合は、お客様手配となることがあります。" },
      { q: "自動販売機は月間何本以上売れれば設置ができるの？", a: "メーカーにより基準は異なりますが、最低ラインとしておおよそ月間150本以上の売上が見込める場合に設置が検討されます。" },
      { q: "現場工事場所に設置をしたいが、何ヶ月以上工期が残っていれば設置ができる？", a: "現場工事場所への設置は、最低でも工期が10ヶ月以上残っていることが条件です。これを下回る場合、現在設置可能なメーカーはありません。" },
      { q: "今ある自動販売機が売れ行き不振で撤去されてしまった。代替え自動販売機を置いてもらえますか？", a: "月の販売本数が100本を下回る場合、他メーカーでも設置は難しいです。100本以上であれば入れ替えで設置基準を満たす場合もあるため、一度お問い合わせください。" },
      { q: "お菓子の自動販売機を設置できますか？", a: "お菓子の自動販売機は取り扱いがありません。ただしダイドードリンコに限り、カロリーメイト系をドリンク自販機と一緒に設置できる場合があります。" },
      { q: "電子マネー付きの自動販売機の設置はできますか？", a: "可能です。ただしメーカーによっては売上見込みが条件となるため、基準はお問い合わせください。" },
      { q: "自動販売機の電気代はいくらくらいでしょうか？", a: "機種により大きく異なります。省エネタイプは月1,500〜2,000円程度、それ以外は3,000〜4,000円程度が目安です。" },
      { q: "狭いスペースでも自動販売機の設置は可能でしょうか？", a: "メーカーにより細型・スリム型を提供している場合があり、狭いスペースでも設置可能なことがあります。" }
    ]
  end
end
