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

  test do
    system "true"
  end

  def post_install
      #database setup
      #system "initdb", "/usr/local/var/postgres"
      #
      #pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start 
      #mkdir -p ~/Library/LaunchAgents
      #ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
      #sleep 5
      #psql postgres -c "create role msf login password '$MSFPASS'" >> $LOGFILE 2>&1
      #createdb -O msf msf -h localhost >> $LOGFILE 2>&1
      #bundle
      # brew install homebrew/versions/ruby193
      #gem install pg
      #gem install bundler
      #gem install i18n
      #gem install multi_json
      system('mkdir', '-p', File.join(prefix, '.git'))
  end

end
