bar_size=40
bar_char_done="#"
bar_char_todo="-"
bar_percentage_scale=2

show_progress ()
{
    current="$1"
    total="$2"

    # calculate the progress in percentage
    percent=$(bc <<< "scale=$bar_percentage_scale; 100 * $current / $total" )
    # The number of done and todo characters
    done=$(bc <<< "scale=0; $bar_size * $percent / 100" )
    todo=$(bc <<< "scale=0; $bar_size - $done" )

    # build the done and todo sub-bars
    done_sub_bar=$(printf "%${done}s" | tr " " "${bar_char_done}")
    todo_sub_bar=$(printf "%${todo}s" | tr " " "${bar_char_todo}")

    # output the bar
    printf "\rCompressing files: [${done_sub_bar}${todo_sub_bar}] ${percent}%%"

    if [ $total -eq $current ]; then
        echo -e "\nDONE"
    fi
}

usage ()
{
	echo "Usage: pdfcompress [options]\n"
	echo "-h|--help		print help"
	echo "-d|--dir		input directory"
	echo "-o|--output	output directory"
	echo "-r|--resolution	resolution"
	echo "-i|--interactive	interactive mode"
}

pdfcompress ()
{
        output=$output_dir/$1
        output_folder=$(dirname "$output")

        mkdir -p "$output_folder"

        gs \
        -q \
        -dNOPAUSE \
        -dBATCH \
        -dSAFER \
        -sDEVICE=pdfwrite \
        -dCompatibilityLevel=1.4 \
        -dPDFSETTINGS=/screen \
        -dEmbedAllFonts=true \
        -dSubsetFonts=true \
        -dColorImageDownsampleType=/Bicubic \
        -dColorImageResolution=$resolution \
        -dGrayImageDownsampleType=/Bicubic \
        -dGrayImageResolution=$resolution \
        -dMonoImageDownsampleType=/Bicubic \
        -dMonoImageResolution=$resolution \
        -sOutputFile=$output \
        $1;
}

interactive=
dir=.
output_dir=compressed
resolution=144

while [ "$1" != "" ]; do
    case $1 in
        -d | --dir )            shift
                                dir=$1
                                ;;
        -o | --output )		      shift
                                output_dir=$1
                                ;;
        -r | --resolution )	    shift
                                resolution=$1
				                        ;;
        -i | --interactive )    interactive=1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

if [ "$interactive" = "1" ]; then
	response=

	read -p "Enter input dir [default: .] > " response
	if [ -n "$response" ]; then
		dir="$response"
	fi

	response=

	read -p "Enter output dir [default: compressed]> " response
	if [ -n "$response" ]; then
		output_dir="$response"
	fi

	response=

	read -p "Enter image resolution [default: 144]> " response
	if [ -n "$response" ]; then
                resolution="$response"
        fi
fi

echo "Size before compression: $(du -sh "$dir" | cut -f1)\n"

total_tasks=$(find $dir -name '*.pdf' | wc -l)

current_task=0

for i in $(find $dir -name '*.pdf')
do
	show_progress $current_task $total_tasks
	filename=$(printf %q "$i")
	pdfcompress "$filename"
	current_task=$((current_task+1))
done

echo "\n\nSize after compression: $(du -sh "$output_dir" | cut -f1)\n"
