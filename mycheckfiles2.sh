#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo "Time taken (s)"
tail rplpl-slurm*.out

echo
echo "#==========================================================="
echo "Start Times"

# Show first "time.struct_time" with filename
for f in rplpl-slurm*.out rplspl-slurm*.out; do
    if [ -f "$f" ]; then
        echo -n "$f: "
        grep "time.struct_time" "$f" | head -n 1
    fi
done

echo "End Times"

# Show last "time.struct_time" with filename
for f in rplpl-slurm*.out rplspl-slurm*.out; do
    if [ -f "$f" ]; then
        echo -n "$f: "
        grep "time.struct_time" "$f" | tail -n 1
    fi
done

