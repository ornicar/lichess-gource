#!/bin/sh

rm out/*.txt

for repo in dmChessPlugin lichess-old lila scalachess scalalib compression chessground chessops lila-ws lila-fishnet lila-search lila-openingexplorer lila-tablebase lila-push lichobile fishnet irwin lila-ip2proxy lila-gif lichess-api lichess-puzzler scalachessjs capacitor-stockfish cordova-plugin-stockfish chess-openings lichess-bot lichess-sysadmin lichess-db; do
  echo $repo
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
sed -i -r 's/\|clarkerubber\|/|James Clarke|/' out/combined.txt
sed -i -r 's/\|ornicar\|/|Thibault Duplessis|/' out/combined.txt
sed -i -r 's/\|cchantep\|/|Cédric Chantepie|/' out/combined.txt
sed -i -r 's/\|(l|L)ucas\|/|Lucas Bonnet|/' out/combined.txt
sed -i -r 's/\|Lukhas\|/|Lucas Bonnet|/' out/combined.txt
sed -i -r 's/\|root\|/|Lucas Bonnet|/' out/combined.txt
sed -i -r '/dependabot/Thibault Duplessis/d' out/combined.txt
sed -i -r '/Scala Steward/Thibault Duplessis/d' out/combined.txt

echo "Done"
