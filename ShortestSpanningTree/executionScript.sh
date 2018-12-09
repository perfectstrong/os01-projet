#! bin/sh

./InputGenerator

for files in $(ls input/) do
   ./mainVO "$files"
   ./mainV1 "$files"
   ./mainV2 "$files"
done

