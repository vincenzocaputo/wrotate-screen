#!/bin/bash
monitor-sensor --accel| while read -r line; do 
	if [[ $line =~ "orientation" ]]; then 
		if [[ $line =~ "changed" ]]; then 
			newOr=$(echo $line | grep -o -E "changed:.*" | sed "s/changed: //");
		else
			oldOr=$(echo $line | grep -o -E "orientation: [^\)]*" | sed "s/orientation: //"); 
		fi;
		echo "$oldOr -> $newOr";
		if [[ -n $newOr ]]; then
			if [[ $oldOr == "normal" ]]; then
				if [[ $newOr == "right-up" ]]; then
					ydotool key $(printf '29:1 66:1 66:0 29:0 %.0s' {1..3})
				fi;
				if [[ $newOr == "left-up" ]]; then
					ydotool key $(printf '29:1 66:1 66:0 29:0 %.0s' {1})
				fi;
				if [[ $newOr == "bottom-up" ]]; then
					ydotool key $(printf '29:1 66:1 66:0 29:0 %.0s' {1..2})
				fi;
			fi;
			if [[ $oldOr == "left-up" ]]; then
				if [[ $newOr == "normal" ]]; then
					ydotool key $(printf '29:1 66:1 66:0 29:0 %.0s' {1..3})
				fi;
				if [[ $newOr == "bottom-up" ]]; then
					ydotool key $(printf '29:1 66:1 66:0 29:0 %.0s' {1})
				fi;
				if [[ $newOr == "right-up" ]]; then
					ydotool key $(printf '29:1 66:1 66:0 29:0 %.0s' {1..4})
				fi;
			fi;
			if [[ $oldOr == "bottom-up" ]]; then
				if [[ $newOr == "left-up" ]]; then
					ydotool key $(printf '29:1 66:1 66:0 29:0 %.0s' {1..3})
				fi;
				if [[ $newOr == "right-up" ]]; then
					ydotool key $(printf '29:1 66:1 66:0 29:0 %.0s' {1})
				fi;
				if [[ $newOr == "normal" ]]; then
					ydotool key $(printf '29:1 66:1 66:0 29:0 %.0s' {1..2})
				fi;
			fi;
			if [[ $oldOr == "right-up" ]]; then
				if [[ $newOr == "bottom-up" ]]; then
					ydotool key $(printf '29:1 66:1 66:0 29:0 %.0s' {1..3})
				fi;
				if [[ $newOr == "normal" ]]; then
					ydotool key $(printf '29:1 66:1 66:0 29:0 %.0s' {1})
				fi;
				if [[ $newOr == "left-up" ]]; then
					ydotool key $(printf '29:1 66:1 66:0 29:0 %.0s' {1..2})
				fi;
			fi;
			oldOr=$newOr;
		fi;
fi; done
