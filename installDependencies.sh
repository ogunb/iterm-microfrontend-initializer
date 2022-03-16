[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

which -s brew
if [[ $? != 0 ]] ; then
  echo "Homebrew is required for this installation:";
  echo "https://brew.sh/";
  exit;
fi

if ! [[ -s $HOME/.nvm/nvm.sh ]]; then
  echo "nvm is not found, installing: https://github.com/nvm-sh/nvm";
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash;
  . $HOME/.nvm/nvm.sh;
  nvm install 10;
  nvm use 10;
fi

which -s ttab
if [[ $? != 0 ]] ; then
  echo "ttab package is not found globally, installing: https://www.npmjs.com/package/ttab";
  sudo npm i -g ttab;
fi

which -s jq
if [[ $? != 0 ]] ; then
  echo "jq package is not found, installing: https://stedolan.github.io/jq";
  brew install jq;
fi
