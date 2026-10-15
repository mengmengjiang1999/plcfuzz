for file in ./; do

cloc "$file" --by-file  --csv --report-file="${file}_cloc.csv"

done