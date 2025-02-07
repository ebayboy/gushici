#!/bin/bash -x 

COOKIE='login=flase; HMACCOUNT=6B42129CA71BA4EB; ASP.NET_SessionId=a2ptenkejrohxdtnohbrcpoh; gsw2017user=5148311%7c2C428FD5C58A29DE65C05BB7DDA24FEE%7c2000%2f1%2f1%7c2000%2f1%2f1; gswZhanghao=18911438143; gswPhone=18911438143; idsMingju2017=%2c174905%2c38175%2c16775%2c21197%2c4882%2c5909%2c5423%2c4655%2c10573%2c6713%2c5930%2c4609%2c12544%2c13511%2c37233%2c732%2c167634%2c4672%2c3913%2c150051%2c77396%2c33911%2c225%2c94440%2c102901%2c151864%2c3259%2c94802%2c31430%2c32579%2c94845%2c94852%2c; idsGuji2017=%2c152%2c; Hm_lvt_9007fab6814e892d3020a64454da5a55=1736488406,1738911904; Hm_lpvt_9007fab6814e892d3020a64454da5a55=1738912040'

for((n=1;n<100;n++))
do
    echo "load page_[$n] ..."
    UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"
    curl -o "$n.html" -H"User-Agent: $UA" -H"Cookie: $COOKIE" "https://www.gushiwen.cn/user/collect.aspx?type=s&p=${n}&id=5148311&sort=t"
    lists=(`cat "$n.html" | grep "shiwenv_" | grep -oP 'href="/\K[^"]+' | sed 's/.aspx//'`)
    if [ ${#lists[@]} -eq 0 ];then
        echo "size 0 exit!"
        exit 0
    fi

    echo "lists:$lists"
    for((i=0;i<${#lists[@]};i++))
    do
        # download detail
        echo "download page_[$n] ${lists[$i]}"
        curl -H"User-Agent: $UA" -H"Cookie: $COOKIE" -o "${lists[$i]}.html" "https://www.gushiwen.cn/${lists[$i]}.aspx"
        cat "${lists[$i]}.html" | grep "${lists[$i]}" | grep "https://www.gushiwen.cn/${lists[$i]}.aspx" | grep -oP '(?<=">).*(?=https)' > "${lists[$i]}.txt"
        sleep 1
    done
done

exit 1
