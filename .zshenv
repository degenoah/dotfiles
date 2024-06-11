# This way of doing things is better.
# https://superuser.com/a/598924

path=(
  ~/.local/bin 
  $(go env GOPATH)/bin
  $path
)

# remove any duplicates because FUCK this shit
typeset -U path

export PATH
