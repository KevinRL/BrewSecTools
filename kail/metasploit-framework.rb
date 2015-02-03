# author kevinl
class MetasploitFramework < Formula
  homepage "http://metasploit.com/"
  url "https://github.com/rapid7/metasploit-framework/archive/HEAD.zip"
  version "1.0"
  sha1 "fdbf458f71dd796aad42f4be9882268bf5378f62"


  head "https://github.com/rapid7/metasploit-framework.git"

  depends_on :java 
  depends_on :postgresql => ["without-ossp-uuid"]
  depends_on "nmap"

  def install
      prefix.install Dir["*"]
      prefix.install Dir[".[^.]*"]
      bin.install_symlink Dir[prefix/"msf*"]
  end

  def post_install
      system('mkdir', '-p', File.join(prefix, '.git'))
  end

end
