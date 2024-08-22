#!/bin/bash


# 诗 = 所有诗词 - 词牌名的部分

cipai=(浣溪沙 卜算子 蝶恋花 行香子 临江仙 一剪梅 鹧鸪天 踏莎行 西江月 菩萨蛮 渔家傲 清平乐 江城子 武陵春 如梦令 丑奴儿 鹊桥仙 青玉案 雨霖铃 醉花阴 诉衷情 虞美人 苏幕遮 苍梧谣 破阵子 相见欢 玉蝴蝶 状江南 点绛唇 满江红 满庭芳 渔歌子 沁园春 永遇乐 水调歌头 木兰花 望江南 扬州慢 念奴娇 山坡羊 小重山 定风波 孤雁儿 天净沙 声声慢 南歌子 使东川)

grepStr=""
for((i=0;i<${#cipai[@]};i++))
do
    grepStr="$grepStr | grep -v ${cipai[i]}"
done

echo $grepStr

cmd="cat ./all.txt $grepStr"

eval $cmd


