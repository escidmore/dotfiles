# Prints the local network IPv4 address for a statically defined NIC or search for an IPv4 address on all active NICs.

run_segment() {
	local lan_file="${TMUX_POWERLINE_DIR_TEMPORARY}/lan_ip.txt"
	if [ -f $lan_file ]; then
			truncate -s 0 $lan_file
	fi
	if shell_is_bsd || shell_is_osx ; then
<<<<<<< HEAD
		all_nics=$(ifconfig 2>/dev/null | awk -F':' '/^[a-z]/ && !/^lo/ && !/^vmnet/ && !/^vbox/ { print $1 }')
=======
		all_nics=$(ifconfig 2>/dev/null | awk -F':' '/^[a-z]/ && !/^lo/ && !/^vmnet/ && !/^vboxnet/ { print $1 }')
>>>>>>> b11dfbb17755f04a4c1b9c00d92b742bb744a8d6
		for nic in ${all_nics[@]}; do
			ipv4s_on_nic=$(ifconfig ${nic} 2>/dev/null | awk '$1 == "inet" { print $2 }')
			for lan_ip in ${ipv4s_on_nic[@]}; do
				[[ -n "${lan_ip}" ]] && break
			done
			[[ -n "${lan_ip}" ]] && break
		done
	else
		# Get the names of all attached NICs.
		all_nics="$(ip addr show | cut -d ' ' -f2 | tr -d :)"
		all_nics=(${all_nics[@]//lo/})	 # Remove lo interface.

		for nic in "${all_nics[@]}"; do
			# Parse IP address for the NIC.
			lan_ip="$(ip addr show ${nic} | grep '\<inet\>' | tr -s ' ' | cut -d ' ' -f3)"
			# Trim the CIDR suffix and output to $lan_file
			if [ -n "$lan_ip" ]; then
				while read -r line; do
					line="${line%/*}"
					echo "$line" >> $lan_file
				done <<< "$lan_ip"
			fi
			lan_ip="${lan_ip%/*}"
			# Only display the last entry
			lan_ip="$(echo "$lan_ip" | tail -1)"

			if [ -n "$lan_ip" ]; then
				break
			fi
		done
	fi

	echo "ⓛ ${lan_ip-N/a}"
	return 0
}
