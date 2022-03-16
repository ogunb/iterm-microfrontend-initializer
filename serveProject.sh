[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

intexit() {
    # Kill all subprocesses (all processes in the current process group)
    kill -HUP -$$
}

hupexit() {
    # HUP'd (probably by intexit)
    echo
    echo "Exiting..."
    exit
}

use_node_version() {
    if [[ $(nvm ls | grep v$1) == "" ]]; then
        nvm install $1
        nvm use $1
    else
        nvm use $1
    fi
}

pull_latest_code() {
    if [ $(jq -r '.autoFetch' <<< $domain) == true ]; then
        git pull
    fi
}

trap hupexit HUP
trap intexit INT

domain_name=$1;
echo $domain_name;

domain="$(jq -r ".${domain_name}" repos.json)";

if [ $(jq -r '.nodeVersion' <<< $domain) == null ];
    then use_node_version 10;
    else use_node_version $(jq -r '.nodeVersion' <<< $domain);
fi

cd $(jq -r '.local' <<< $domain) &&
pull_latest_code &&
npm install &&
npm run $(jq -r '.scripts.serve' <<< $domain)

wait
