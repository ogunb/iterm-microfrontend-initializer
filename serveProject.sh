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

trap hupexit HUP
trap intexit INT

domain_name=$1;
echo $domain_name;

domain="$(jq -r ".${domain_name}" repos.json)";

if [ $(jq -r '.nodeVersion' <<< $domain) == null ];
    then nvm use 10;
    else nvm use $(jq -r '.nodeVersion' <<< $domain);
fi

cd $(jq -r '.local' <<< $domain) &&
npm install &&
npm run $(jq -r '.scripts.serve' <<< $domain)

wait
