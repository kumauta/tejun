#!/bin/bash

infile=base.txt
outfile=tejyun.html
cnt=0

# output header
cat templates/header.html > ${outfile}

IFS=$'\n';
for line in `cat ${infile} | sed "s/^$ //"`
do
  if [ `echo "${line}" | grep -c "^#"` -eq 1 ];then
    if [ `echo "${line}" | grep -c "^##"` -eq 1 ];then
      # section header
      echo "<br><div style=\"color:red; font-size:14pt; font-weight: bold;\"> ${line} </div>" >> ${outfile} >> ${outfile}
    else
      # comment
      echo "${line} <br>" >> ${outfile}
    fi
  else
echo ${line} >> /tmp/aaa.txt
    # "を文字参照化
    line=`echo ${line} | sed 's/\"/\&quot;/g'`
    # 'を文字参照化
    line=`echo ${line} | sed "s/\'/\&#39;/g"`

    echo "<input id=\"eId${cnt}\" size=\"150\" type=\"text\" value=\"${line}\" readonly><button onclick=\"copyToClipboard('eId${cnt}')\">Copy</button><br>" >> ${outfile}
    cnt=`expr ${cnt} + 1`
  fi
done

# output footer
cat templates/footer.html >> ${outfile}
