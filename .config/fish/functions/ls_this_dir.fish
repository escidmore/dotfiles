function ls_this_dir
	set -l path (commandline -t)
	if test -d $path
		printf "\n"
		ls $path
		commandline -f repaint
	end
end