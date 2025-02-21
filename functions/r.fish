function r
    set -l temp_file (mktemp)
    ranger --choosedir=$temp_file --selectfile=$PWD
    if test -f $temp_file
        set -l dir (cat $temp_file)
        if test -d "$dir"
            cd "$dir"
        end
    end
    rm -f $temp_file
end
