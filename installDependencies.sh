which -s brew
if [[ $? != 0 ]] ; then
  echo "Homebrew is required for this installation:";
  echo "https://brew.sh/";
  exit;
fi

which -s nvm
if [[ $? != 0 ]] ; then
  echo "nvm is not found, installing: https://github.com/nvm-sh/nvm";
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash;
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
