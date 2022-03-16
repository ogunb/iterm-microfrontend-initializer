# This script depends on following packages.
# iterm2: https://iterm2.com/
# nvm: https://github.com/nvm-sh/nvm
# jq: https://stedolan.github.io/jq
# ttab: https://github.com/mklement0/ttab

source ./installDependencies.sh;
source ./defaultApps.sh;

DOMAIN_NAMES=$(jq -r 'keys[]' repos.json)
selected_domains="$(get_default_apps) ${*}"

for domain_name in $selected_domains
do
    domain="$(jq -r ".${domain_name}" repos.json)"

    if test -f "$(jq -r '.local' <<< $domain)/package.json"; then
        echo "🤖 - Found ${domain_name} on local...."
        continue
    fi

    echo "🥡  - ${domain_name} not found on local. Start fetch from remote...";

    git clone $(jq -r '.remote' <<< $domain) $(jq -r '.local' <<< $domain);

    echo "🍻  - ${domain_name} cloned."
done

for domain_name in $selected_domains
do
    ttab ./serveProject.sh $domain_name -t $domain_name
done
