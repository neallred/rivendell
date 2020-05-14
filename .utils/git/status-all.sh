for c in $PROJECT_CONTAINERS
do
  echo CONTAINER $c
  repos=$(ls -d $c/*/)
  for r in $repos
  do
    pushd $r > /dev/null
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null ) != "true" ]]; then
      echo $r not a repo
      popd > /dev/null
      continue
    fi
    branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null )
    if [[ $branch != "master" ]]; then
      echo $r at $branch
    fi
    if [ -z "$(git status --porcelain)" ]; then 
      # Working directory clean
      :
    else 
      # Working directory clean
      echo "$r" has changes 
    fi
    popd > /dev/null
  done
done
