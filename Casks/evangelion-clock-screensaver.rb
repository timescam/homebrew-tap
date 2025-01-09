cask "evangelion-clock-screensaver" do
	version "1.1.2"
	sha256 "8a0a91488a1c746628939133d379aeed58118271769cee2d6c91c82ebb55b96f"
  
	url "https://github.com/Wandmalfarbe/evangelion-clock-screensaver/releases/download/v.#{version}/Evangelion-Clock-#{version}.saver.zip"
	name "Evangelion Clock Screensaver"
	desc "A digital clock screensaver inspired by the graphical interfaces from Neon Genesis Evengelion. "
	homepage "https://github.com/Wandmalfarbe/evangelion-clock-screensaver"
  
	screen_saver "Evangelion Clock.saver"
  
	# No zap stanza required
  end