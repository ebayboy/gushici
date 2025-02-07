

## 目录说明
all.txt 包含古诗+文言文，带词标题
all_no_title.txt  包含古诗+文言文，只有原文, 没有标题
curl.sh 请求命令， 需替换token
feihualing 飞花令目录, 里面只有古诗
readme.md
txt 下载的古诗会存储到txt目录

## 技术原理

cookie: 
login=flase; HMACCOUNT=6B42129CA71BA4EB; ASP.NET_SessionId=a2ptenkejrohxdtnohbrcpoh; gsw2017user=5148311%7c2C428FD5C58A29DE65C05BB7DDA24FEE%7c2000%2f1%2f1%7c2000%2f1%2f1; gswZhanghao=18911438143; gswPhone=18911438143; idsMingju2017=%2c174905%2c38175%2c16775%2c21197%2c4882%2c5909%2c5423%2c4655%2c10573%2c6713%2c5930%2c4609%2c12544%2c13511%2c37233%2c732%2c167634%2c4672%2c3913%2c150051%2c77396%2c33911%2c225%2c94440%2c102901%2c151864%2c3259%2c94802%2c31430%2c32579%2c94845%2c94852%2c; idsGuji2017=%2c152%2c; Hm_lvt_9007fab6814e892d3020a64454da5a55=1736488406,1738911904; Hm_lpvt_9007fab6814e892d3020a64454da5a55=1738912040

1. 请求list 第一页
```
请求网址:
https://www.gushiwen.cn/user/collect.aspx?type=s&p=1&id=5148311&sort=t
请求方法:
GET
状态代码:
200 OK
远程地址:
123.125.216.219:443
引荐来源网址政策:
strict-origin-when-cross-origin
```

第二页
```
请求网址:
https://www.gushiwen.cn/user/collect.aspx?type=s&p=2&id=5148311&sort=t
请求方法:
GET
状态代码:
200 OK
远程地址:
123.125.216.219:443
引荐来源网址政策:
strict-origin-when-cross-origin
```

responses内容如下：
```html
        <div id="mainSearch" class="mainSearch">
            <div class="searchleft">
                <a style="color: #FFFFFF; background-image: url(https://ziyuan.guwendao.net/siteimg/seachimg.jpg); background-repeat: no-repeat;">诗文</a>
                <a href="/user/collect.aspx?type=m&id=5148311&sort=t">名句</a>
                <a href="/user/collect.aspx?type=a&id=5148311&sort=t">作者</a>
                <a href="/user/collect.aspx?type=d&id=5148311&sort=t">古籍</a>
            </div>
            <div class="left">
                <div class="sons" style="padding-bottom: 12px;">
                    <div class="cont" style="margin-top: 12px; border-bottom: 1px dashed #DAD9D1; padding-bottom: 7px;">
                        <a style="float: left;" target="_blank" href="/shiwenv_4b3ccba01be6.aspx">
                            别董大<span style="color: #65645F;">- 高适</span>
                        </a>
                        <img style="float: right; margin-top: 4px; cursor: pointer;" id="likeImg345017" name="0" onclick="changeLike(345017,'A0E1A4BC92B45ABF','http://www.gushiwen.cn/user/collect.aspx')" src="https://ziyuan.guwendao.net/siteimg/shou-cangok.png" alt="已收藏" width="19" height="19"/>
                    </div>
                    <div class="cont" style="margin-top: 12px; border-bottom: 1px dashed #DAD9D1; padding-bottom: 7px;">
                        <a style="float: left;" target="_blank" href="/shiwenv_da53e010d00c.aspx">
                            灵隐寺<span style="color: #65645F;">- 宋之问</span>
                        </a>
```
+ 文本过滤出关键字 shiwenv_, 存储到list中
+ get list中的， 格式如： https://www.gushiwen.cn/shiwenv_4b3ccba01be6.aspx

## 请求详情页
请求网址:
https://www.gushiwen.cn/shiwenv_4b3ccba01be6.aspx
请求方法:
GET
状态代码:
200 OK
远程地址:
123.125.216.229:443
引荐来源网址政策:
strict-origin-when-cross-origin
