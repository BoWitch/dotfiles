function __cache_or_get_cap_completion -d "Create cap completions"
  set -l cf
  set -l cfp
  for r in Capfile capfile Capfile.rb capfile.rb
    set cfp (lookup $r)
    and set cf $r; and break
  end
  if [ -z $cf ]
    return 0
  end

  __cache_zap cap $cf -not -mnewer $cfp/$cf
  __cache_or_get cap $cf 'cap -T 2>&1 | sed -e "s/^cap \([a-z:_0-9!\-]*\).*#\(.*\)/\1	\2/"'
end

complete -r -c cap -a "(__cache_or_get_cap_completion)"