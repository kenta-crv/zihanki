ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# Ruby 3.0+ での Base64.strict_decode64 の厳格化による ArgumentError 回避パッチ
require 'base64'
class << Base64
  alias_method :original_strict_decode64, :strict_decode64
  def strict_decode64(str)
    return nil if str.nil?
    # 改行や不正な文字が含まれている場合に例外にせず、
    # 以前の互換性を保つために優しく処理するか、空白を除去
    original_strict_decode64(str.strip.delete("\n\r"))
  rescue ArgumentError
    nil
  end
end

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.