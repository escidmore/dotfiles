function origin
	pushd $PWD
cd $argv
git remote get-url origin
popd
end
