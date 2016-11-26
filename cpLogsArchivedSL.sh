#!/bin/sh

export PS1="\[$(tput setaf 2)\][\t][\u@\h \W] \!$\[$(tput sgr0)\] "
pdir=/apps01
cd $pdir

display_usage() {
	echo -e "*** SCRIPT to copy ARCHIVED logs from AWS S3 server ***";
        echo -e "[ USAGE ] $0 date_archive sub_bucket";
        echo -e "[ EXAMPLE ] $0 2015-11-09 msite/web";
	echo -e "*** Archived logs will be copied under $pdir/sl_{date_archive} like /apps01/sl_2015-11-09 (yyyy-mm-dd) ***";
}

if [ $# -le 1 ]; then
	display_usage;
	exit 1;
fi

pdir=/apps01
cd $pdir

date_archive=$1;
ddir=$pdir/sl_$date_archive;
mkdir -p $ddir; cd $ddir;

pushd .

sub_bucket=$2;
pbucket=s3://sd-archived-logs/
bucket=$pbucket$sub_bucket/
servers=`aws s3 ls $bucket | awk '{ print $2 }'`

for server in $servers; do
	dsdir=$ddir/$server
	mkdir -p $dsdir;

	bs=$bucket$server;
	dafiles=`aws s3 ls $bs --recursive | grep -i "$date_archive" | awk '{ print $4 }'`;
	for dafile in $dafiles; do
		aws s3 cp $pbucket$dafile $dsdir 2>/dev/null;
	done;
done

popd

