#!/bin/sh

rm out/*.txt

for repo in lichess-old lila scalachess scalalib compression chessground chessops lila-ws lila-fishnet lila-search lila-openingexplorer lila-tablebase lila-push lichobile fishnet irwin lila-ip2proxy lila-gif lichess-api lichess-puzzler; do
  echo $repo
  gource --output-custom-log out/$repo.txt ~/$repo
  sed -i -r "s#(.+)\|#\1|/$repo#" out/$repo.txt
  sed -i '/node_modules/d' out/$repo.txt
done

# cat lichess-old-delete >> out/lichess-old.txt
sed -i -r '/\/CordovaLib\//d' out/lichobile.txt
sed -i -r '/\/plugins\//d' out/lichobile.txt

cat out/*.txt | sort -n > out/combined.txt

sed -i -r '/\/images\/flags?\//d' out/combined.txt
sed -i -r '/\/vendors?\//d' out/combined.txt
sed -i -r '/\.DS_Store/d' out/combined.txt
sed -i -r 's/\|ornicar\|/Thibault Duplessis/' out/combined.txt
