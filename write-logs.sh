#!/bin/sh -e

rm -f out/*.txt
base_dir=$(pwd)

for repo in dmChessPlugin lichess-old lila scalachess scalalib compression chessground chessops lila-ws lila-fishnet lila-search lila-openingexplorer lila-tablebase lila-push lichobile fishnet irwin lila-ip2proxy lila-gif lichess-api lichess-puzzler scalachessjs capacitor-stockfish cordova-plugin-stockfish chess-openings lichess-bot lichess-sysadmin lichess-db lichess-pgn-viewer lila-http external-engine kaladin lila-ip2proxy lila-db-seed; do
  echo $repo
  cd ~/$repo
  git pull
  cd $base_dir
  gource --output-custom-log out/$repo.txt ~/$repo
  sed -i -r "s#(.+)\|#\1|/$repo#" out/$repo.txt
  sed -i '/node_modules/d' out/$repo.txt
done

echo "Clean up..."

# cat lichess-old-delete >> out/lichess-old.txt
sed -i -r '/\/CordovaLib\//d' out/lichobile.txt
sed -i -r '/\/plugins\//d' out/lichobile.txt
sed -i -r '/www\/i18n\//d' out/lichobile.txt
sed -i -r '/app\/platforms\//d' out/lichobile.txt
sed -i -r '/www\/(i18n|moment)\//d' out/lichobile.txt
sed -i -r '/ios\/App\/App/d' out/lichobile.txt
sed -i -r 's#/lichobile/project/#/lichobile/#' out/lichobile.txt
sed -i -r 's#/lichobile/src/#/lichobile/#' out/lichobile.txt
sed -i -r 's#/lichobile/js/#/lichobile/#' out/lichobile.txt

sed -i -r '/conf\/(i18n\/)?messages/d' out/lila.txt
sed -i -r '/modules\/i18n\/messages/d' out/lila.txt
sed -i -r '/translation\/dest/d' out/lila.txt
sed -i -r '/i18n\/crowdin/d' out/lila.txt
sed -i -r '/css\/build/d' out/lila.txt

sed -i -r 's#/scalachess/src/#/scalachess/#' out/scalachess.txt

sed -i -r 's#/lila-ws/src/#/lila-ws/#' out/lila-ws.txt

sed -i -r 's#/lichess-old/src/Bundle/#/lichess-old/#' out/lichess-old.txt

cat out/*.txt | sort -n > out/combined.txt

sed -i -r '/\/images\/flags?\//d' out/combined.txt
sed -i -r '/\/vendors?\//d' out/combined.txt
sed -i -r '/\.DS_Store/d' out/combined.txt
sed -i -r '/\.idea/d' out/combined.txt
sed -i -r '/@gmail\.com/d' out/combined.txt
sed -i -r 's/\|clarkerubber\|/|James Clarke|/' out/combined.txt
sed -i -r 's/\|ornicar\|/|Thibault Duplessis|/' out/combined.txt
sed -i -r 's/\|cchantep\|/|Cédric Chantepie|/' out/combined.txt
sed -i -r 's/\|(l|L)u(c|kh)as\|/|Lucas Bonnet|/' out/combined.txt
sed -i -r 's/\|root\|/|Lucas Bonnet|/' out/combined.txt
sed -i -r 's/Scala Steward/Thibault Duplessis/' out/combined.txt

echo "Done"
