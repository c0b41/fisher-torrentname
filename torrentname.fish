# SYNOPSIS
#   torrentname [name]
#
# USAGE
#  {name} torrent show filename
#

function torrentname
  if type -t torrent-name jq
    set data  (eval torrent-name $argv)
  	set title (echo $data | jq -r '.title' | sed -e "s/\b\(.\)/\u\1/g" )
  	set season (echo $data | jq -r '.season' )
  	set episode (echo $data | jq -r '.episode' )
  	set new "$title  S0$season x E0$episode"
  	echo $new
  else
    echo "📂  Please install 'npm install -g torrrent-name && jq ' first!"
  end
end
