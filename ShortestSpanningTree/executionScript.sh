#! bin/sh

./InputGenerator

for files in $(ls input/); do
    echo "$files"
    if [ "$files" != "input_10000_10_10.txt" ]; then
        echo "V0"
       ./mainV0 "./input/$files" "output/outputV0_$files"
        echo "V1"
       ./mainV1 "./input/$files" "output/outputV1_$files"
   fi
   echo "V2"
   ./mainV2 "./input/$files" "output/outputV2_$files"
done

