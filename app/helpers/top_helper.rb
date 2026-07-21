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
end
