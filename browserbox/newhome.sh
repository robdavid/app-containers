
KDB_DIRS=($((for file in $(find $HOME/Nextcloud -name \*.kdbx); do echo $(dirname $file); done) | sort | uniq))
KDB_PARENTS=($((for file in "${KDB_DIRS[@]}"; do echo $(dirname $file); done) | sort | uniq))

for dir in "${KDB_PARENTS[@]}"; do
    target=$(echo "$dir" | sed -E "s:$HOME/Nextcloud(.*):$HOME/distros/browserbox/Nextcloud\1:")
    echo mkdir --parents "$target"
done

for dir in "${KDB_DIRS[@]}"; do
done

