#for dir in `ls -d 02??`; do echo $dir; cd $dir; awk -f ../../makecsv.awk `ls *` > ../../csvs/$dir.csv; cd ..; done
#nl 02??.csv | sed 's/ *\([0-9]*\)\t/\1|/' > 2014-02.csv &

#set -x
srcdirs=$1
genpath=`/bin/pwd`
scriptpath=$genpath/..

cd $srcdirs
for dir in `ls $srcdirs` ; do echo $dir; (cd $dir ; awk -f $scriptpath/makecsv.awk * | nl -v `cat $genpath/last_count` | sed 's/ *\([0-9]*\)\t\(.*\)$/\1|\2/' > $genpath/$dir.csv; echo $((`tail -n 1 $genpath/$dir.csv | cut -d'|' -f1` + 1)) > $genpath/last_count) ; done

