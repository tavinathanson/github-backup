set -e
set -x

curl --user "$USER:$PASSWORD" "https://api.github.com/orgs/$ORG/repos?page=$PAGE&per_page=100" |
  grep -e 'html_url*' |
  cut -d \" -f 4 |
  grep $ORG/ |
  xargs -L1 git clone
