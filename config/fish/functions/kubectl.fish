function ktoken
  set name $argv[1]
  if set -q $argv
    set name hanzik
  end
  k get -n kube-system secret (kubectl get serviceaccounts $name -n kube-system -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 -D
end