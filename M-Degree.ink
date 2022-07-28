# author: Star
/**
* Title:M属性自评表
* Date:Wed Jul 27 2022 16:37:34 GMT+0800 (中国标准时间)
*/

VAR AllPoint = 0
VAR PetPoint = 0
VAR MPoint = 0

->CHECK_START
=== CHECK_START
~AllPoint = 0
~PetPoint = 0

内容作者@Ahgu
<b>\#NSFW警告</b>
该测试可能包含一些不适宜工作或学习时间进行的内容，请确认周边环境足够安全。
<b>\#适用性警告</b>
该测试部分内容可能仅适用于生理男性。


+ [开始测试]->START_TEST

=== START_TEST ===
VAR tdIndex = 0
VAR tdLength = 10

该测试可能会<b>消耗较长时间</b>，本自评表包含多个类别：
性奴、宠物、性玩具、露出、刑奴、女装、心控、其他
各个选项可以包含多个选项，如：
非常热爱、喜欢、能接受、不确定、厌恶
->Part1_Start
= Part1_Start
->Part1
= Part1
({tdIndex+1}/{tdLength}) 您对<b>"{!强奸|轮奸|舔肛}"</b>的接受程度是？
~tdIndex ++
+ 非常热爱
~MPoint+=1
{tdIndex == tdLength:
->Part2_Start
}
->Part1
+ 喜欢
+ 能接受
+ 不确定
+ 厌恶

= Part2_Start

->Part2
= Part2
->END
    
