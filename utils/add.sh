#!/usr/bin/env bash
read -d '' details << EOF

<details>

### description

### solution

</details>
\  
EOF

ext="html"

if [[ -z $1 ]] || [[ -z $2 ]] || [[ -z $3 ]]; then
    echo "please provide a \$1: filename / \$2: readme details line number / \$3: problem name"
#elif [[ ! -f ../../../utils/details ]]; then
#    echo "missing details file"
else
    echo "creating $ext file: $1.$ext"
    touch $1.$ext
    echo "updating readme"
#    cat ../../../utils/details | sed -i "$2r /dev/stdin" README.md
    sed -i "$2i \ " README.md 
    echo "$details" | sed -i "$2r /dev/stdin" README.md
    sed -i "$(($2+1))i ## $3" README.md
    sed -i "$(($2+2))i [$3](#$3)" README.md
    sed -i "$(($2+4))i <summary>$3</summary>" README.md
    sed -i "$(($2+9))i [$1.$ext](./$1.$ext)" README.md
    echo "done"
fi


