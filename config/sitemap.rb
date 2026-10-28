require Rails.root.join("lib/public_sitemap")

host = "https://xn--new351c2sh.net"
entries = PublicSitemap.compose(
  host: host,
  static_entries: [
    { path: "/", changefreq: "daily", priority: 1.0 },
    { path: "/lp", changefreq: "daily", priority: 0.8 },
    { path: "/asahi", changefreq: "daily", priority: 0.8 },
    { path: "/suntory", changefreq: "daily", priority: 0.8 },
    { path: "/cocacola", changefreq: "daily", priority: 0.8 },
    { path: "/dydo", changefreq: "daily", priority: 0.8 },
    { path: "/itoen", changefreq: "daily", priority: 0.8 },
    { path: "/kirin", changefreq: "daily", priority: 0.8 },
    { path: "/otsuka", changefreq: "daily", priority: 0.8 },
    { path: "/food", changefreq: "weekly", priority: 0.7 },
    { path: "/secondhand", changefreq: "weekly", priority: 0.7 },
    { path: "/original", changefreq: "weekly", priority: 0.7 }
  ]
)

PublicSitemap.write!(host: host, entries: entries)
