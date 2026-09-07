# frozen_string_literal: true

# 自販機ねっと リニューアルLP用のアイコン/ロゴヘルパー
#
# 使い方:
#   = rn_icon('check')
#   = rn_icon('chevron', html_class: 'rn-icon rn-icon--on-btn')
#   = rn_logo
#   = rn_logo(html_class: 'rn-logo-mark rn-logo-mark--sm')
#
# アイコンはすべて 24x24 viewBox / stroke ベースのラインアイコンです。
# 色は currentColor を継承するので、SCSS側の .rn-ico--blue / .rn-ico--solid 等の
# color 指定でまとめて着色できます。
module RenewalHelper
  RN_ICONS = {
    # ナビ / ボタン
    'chevron' => '<path d="M9 5l7 7-7 7"/>',
    'check' => '<path d="M4 12.5l5 5L20 6"/>',
    'minus' => '<path d="M5 12h14"/>',
    'link-ext' => '<path d="M14 4h6v6"/><path d="M20 4L10 14"/><path d="M18 13v6a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h6"/>',

    # 料金 / 状態
    'yen' => '<path d="M6 4l6 7 6-7"/><path d="M12 11v9"/><path d="M8 14h8"/><path d="M8 17h8"/>',
    'gear' => '<circle cx="12" cy="12" r="3.2"/><path d="M12 2.5v3M12 18.5v3M4.2 4.2l2.1 2.1M17.7 17.7l2.1 2.1M2.5 12h3M18.5 12h3M4.2 19.8l2.1-2.1M17.7 6.3l2.1-2.1"/>',
    'warn' => '<path d="M12 3.2l9.5 16.8H2.5z"/><path d="M12 9.5v5"/><path d="M12 17.3h.01"/>',
    'bullseye' => '<circle cx="12" cy="12" r="9"/><circle cx="12" cy="12" r="5"/><circle cx="12" cy="12" r="1.4" fill="currentColor" stroke="none"/>',
    'sliders' => '<path d="M4 6h6M15 6h5M4 12h10M19 12h1M4 18h13M20 18h0"/><circle cx="13" cy="6" r="2"/><circle cx="12" cy="12" r="2"/><circle cx="17" cy="18" r="2"/>',

    # 拠点 / 業種
    'pin' => '<path d="M12 21s7-6.6 7-11.2A7 7 0 1 0 5 9.8C5 14.4 12 21 12 21z"/><circle cx="12" cy="9.8" r="2.4"/>',
    'building' => '<rect x="4" y="3" width="16" height="18"/><path d="M9 7h1M14 7h1M9 11h1M14 11h1M9 15h1M14 15h1"/><path d="M10 21v-4h4v4"/>',
    'factory' => '<path d="M3 21V11l6 4v-4l6 4V8l6 4v9z"/><path d="M3 21h18"/>',
    'train' => '<rect x="5" y="3" width="14" height="14" rx="4"/><path d="M5 11h14"/><circle cx="8.5" cy="13.5" r="1"/><circle cx="15.5" cy="13.5" r="1"/><path d="M8 21l-2 2M16 21l2 2"/>',

    # 人物
    'person' => '<circle cx="12" cy="8" r="4"/><path d="M4 21a8 8 0 0 1 16 0"/>',
    'people' => '<circle cx="9" cy="8" r="3"/><path d="M2 20a7 7 0 0 1 14 0"/><circle cx="17" cy="8.5" r="2.4"/><path d="M15.5 13.2a6 6 0 0 1 6.5 6.8"/>',

    # サポート / コミュニケーション
    'headset' => '<path d="M4.5 13.5a7.5 7.5 0 0 1 15 0"/><rect x="3" y="13" width="4" height="6.5" rx="2"/><rect x="17" y="13" width="4" height="6.5" rx="2"/><path d="M19 19.5v.5a3 3 0 0 1-3 3h-2"/>',
    'phone' => '<path d="M5 4h4l2 5-2.6 1.6a11.5 11.5 0 0 0 5 5L15 13l5 2v4a2 2 0 0 1-2 2A16 16 0 0 1 3 6a2 2 0 0 1 2-2z"/>',
    'mail' => '<rect x="2" y="5" width="20" height="14" rx="2"/><path d="M2.5 6.5L12 13l9.5-6.5"/>',
    'speech-star' => '<path d="M4 4.5h16v11H8.5l-4.5 4z"/><path d="M12 6.8l1 2.1 2.3.3-1.7 1.6.4 2.3-2-1.1-2 1.1.4-2.3-1.7-1.6 2.3-.3z" fill="currentColor" stroke="none"/>',
    'question' => '<circle cx="12" cy="12" r="9.5"/><path d="M9.3 9.3a2.7 2.7 0 1 1 3.9 2.4c-1 .5-1.5 1.1-1.5 2.3"/><path d="M12 17.2h.01"/>',
    'exclaim' => '<circle cx="12" cy="12" r="9.5"/><path d="M12 7v6"/><path d="M12 16.6h.01"/>',
    'doc-x' => '<path d="M6.5 2.5h8l5 5v13a2 2 0 0 1-2 2h-11a2 2 0 0 1-2-2v-16a2 2 0 0 1 2-2z"/><path d="M14.5 2.5v5.5h5.5"/><path d="M9.5 13l5 5M14.5 13l-5 5"/>',
    'heart-hands' => '<path d="M12 20.2s-7.2-4.6-9.6-9.1A5 5 0 0 1 12 6a5 5 0 0 1 9.6 5.1c-2.4 4.5-9.6 9.1-9.6 9.1z"/>',
    'shield' => '<path d="M12 2.5l8 3v6c0 5.2-3.6 9.4-8 11-4.4-1.6-8-5.8-8-11v-6z"/>',

    # 在庫 / 物流
    'box' => '<path d="M3 7.3L12 3l9 4.3-9 4.2-9-4.2z"/><path d="M3 7.3V17l9 4.2 9-4.2V7.3"/><path d="M12 11.5v9.7"/>',
    'cube' => '<path d="M12 2.3l8 4.5v10.4L12 21.7l-8-4.5V6.8z"/><path d="M4 6.8l8 4.5 8-4.5"/><path d="M12 11.3v10.4"/>',
    'truck' => '<rect x="1" y="7.5" width="13" height="8.5" rx="1"/><path d="M14 10.5h3.6l3.4 3.4v2.1h-7z"/><circle cx="5.5" cy="18.3" r="1.6"/><circle cx="17.5" cy="18.3" r="1.6"/>',
    'inbox' => '<path d="M3 12h5l2 3h4l2-3h5"/><path d="M5 4h14l2 8v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-6z"/>',
    'cart' => '<circle cx="9" cy="20" r="1.3"/><circle cx="18" cy="20" r="1.3"/><path d="M2 3h2l2.3 12.4a2 2 0 0 0 2 1.6h7.9a2 2 0 0 0 2-1.6L20 8H6.2"/>',
    'refresh-box' => '<path d="M18 3.5a9.5 9.5 0 1 1-8.4 5"/><path d="M18 3.5v5h-5"/>',
    'clipboard' => '<rect x="5" y="4" width="14" height="17" rx="2"/><rect x="9" y="2" width="6" height="4" rx="1"/><path d="M9 12.5h6M9 16.5h6"/>',

    # 数値 / データ
    'chart' => '<path d="M4 20V10.5"/><path d="M10 20V4"/><path d="M16 20v-7"/><path d="M2.5 20h19"/>',
    'calendar' => '<rect x="3" y="4" width="18" height="17" rx="2"/><path d="M3 9.5h18"/><path d="M8 2v4M16 2v4"/>',
    'bell' => '<path d="M6 8.3a6 6 0 0 1 12 0c0 4.7 2 5.7 2 5.7H4s2-1 2-5.7z"/><path d="M10 21a2 2 0 0 0 4 0"/>',
    'wifi' => '<path d="M2 8.6a16 16 0 0 1 20 0"/><path d="M5 12.6a11 11 0 0 1 14 0"/><path d="M8.5 16.6a6 6 0 0 1 7 0"/><circle cx="12" cy="20.2" r="1" fill="currentColor" stroke="none"/>',
    'cloud' => '<path d="M7 18a4.5 4.5 0 0 1 .4-9 6 6 0 0 1 11.6 2.1A4 4 0 0 1 18 18z"/>',
    'sparkle' => '<path d="M12 3l1.9 5.1L19 10l-5.1 1.9L12 17l-1.9-5.1L5 10l5.1-1.9z"/>',
    'star' => '<path d="M12 3l2.5 5.6 6.1.6-4.6 4 1.4 6-5.4-3.1-5.4 3.1 1.4-6-4.6-4 6.1-.6z"/>',
  }.freeze

  # rn_icon('check', html_class: 'rn-icon') => <svg class="rn-icon" ...>
  def rn_icon(name, html_class: 'rn-icon')
    body = RN_ICONS.fetch(name.to_s) do
      Rails.logger&.warn("[rn_icon] unknown icon: #{name}") if defined?(Rails)
      ''
    end

    %(<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="#{html_class}" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">#{body}</svg>).html_safe
  end

  # 六角形 + 中心ノードのブランドロゴ（青〜紫グラデーション）
  def rn_logo(html_class: 'rn-logo-mark')
    gid = "rnLogoGrad#{SecureRandom.hex(3)}"
    <<~SVG.html_safe
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40" class="#{html_class}" aria-hidden="true">
        <defs>
          <linearGradient id="#{gid}" x1="0" y1="0" x2="1" y2="1">
            <stop offset="0%" stop-color="#2563eb"/>
            <stop offset="100%" stop-color="#7c3aed"/>
          </linearGradient>
        </defs>
        <path d="M20 3.5L33 11v18L20 36.5 7 29V11z" fill="none" stroke="url(##{gid})" stroke-width="2.6" stroke-linejoin="round"/>
        <circle cx="20" cy="20" r="8.5" fill="none" stroke="url(##{gid})" stroke-width="1.6" opacity="0.5"/>
        <circle cx="20" cy="20" r="3.4" fill="url(##{gid})"/>
      </svg>
    SVG
  end
end