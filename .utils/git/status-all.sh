# Needed if repo remotes use ssh and need to be checked for remote HEAD
if [ -f "$HOME/.ssh/id_rsa" ]; then
  if [ -z "$(ssh-add -L)" ]; then
    ssh-add -q $HOME/.ssh/id_rsa
  fi
fi
for c in $PROJECT_CONTAINERS
do
  echo CONTAINER $c
  repos=$(ls -d $c/*/)
  for r in $repos
  do
    declare -a msgs=()
    pushd $r > /dev/null
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null ) != "true" ]]; then
      echo $r not a repo
      popd > /dev/null
      continue
    fi
    branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null )
    if [[ $branch != "master" ]]; then
      # Additional slow check for rarer case that remote HEAD is
      # something other than "master"
      master_branch=$(git remote show origin | grep HEAD | grep -o "\S*\$")
      if [[ $branch != $master_branch ]]; then
        msgs+=("is on branch $branch")
      fi
    fi
    if [ -z "$(git status --porcelain)" ]; then 
      # Working directory clean
      :
    else 
      msgs+=("has changes")
    fi
    msgslength=${#msgs[@]}
    if [ "$msgslength" -gt "0" ]; then
      echo "$r:"
      for (( i=1; i<${msgslength}+1; i++ ));
      do
        echo "  * ${msgs[$i-1]}"
      done
    fi
    popd > /dev/null
  done
done
