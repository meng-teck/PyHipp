#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo
echo "#==========================================================="

slurm_files=$(find . -name "*slurm*.out" | sort)
if [ -n "$slurm_files" ]; then
	echo "Start Times"
	for f in $slurm_files; do
		if [ -f "$f" ]; then
			echo "==> $(basename $f) <=="
			head -10 "$f" | grep -m 1 "time.struct_time" || echo "No start time found"
			echo
		fi
	done

	echo "End Times"
	for f in $slurm_files; do
		if [ -f "$f" ]; then
			echo "==> $(basename $f) <=="
			tail -10 "$f" | grep -A 5 'time.struct_time'
			echo
		fi
	done
fi

echo "#==========================================================="
