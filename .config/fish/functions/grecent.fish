function grecent
  git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format="%(refname:short)"
end
