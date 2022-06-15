# author: Star
//深渊凝视着你
VAR point = 0
->CHECK_START
=== CHECK_START
~point = 0
这是一个XP承受度测试，算法与内容来自网络。
<b>\#NSFW警告</b>
该测试可能包含一些不适宜工作或学习时间进行的内容，请确认周边环境足够安全。
+ 开始测试 ->START_TEST
->DONE

=== START_TEST ===
<br/>
<b>请选择以下内容您能承受的等级，内容分为3个分类级别：人类级、猛兽级、异形级。
<h4>人类级</h4>
->HUMAN
= HUMAN
VAR human_num = 23
VAR human_i = 0
({human_i+1}/{human_num})请问您可以接受<b>"{!口|足|肛|手|乳|小玩具|野战|催眠|妹妹|姐姐|灌肠|紧缚|放置|榨乳|监禁|性转|双穴|NTR|药渍|露出|轻度殴打|榨精|人外}"</b>吗？
~human_i++
+ 喜欢
{   human_i <= 17:
         ~point += 1
    -else:
        ~point += 2
}
{human_i == human_num:
您目前得分<b>{point}</b>分。
<h4>猛兽级</h4>
->BEAST
}
->HUMAN
+ 接受
{   human_i <= 17:
         ~point += 1
    -else:
        ~point += 2
}
{human_i == human_num:
您目前得分<b>{point}</b>分。
<h4>猛兽级</h4>
->BEAST
}
->HUMAN
+ 不接受
{human_i == human_num:
您目前得分<b>{point}</b>分。
<h4>猛兽级</h4>
->BEAST
}
->HUMAN
+ 无所谓
{   human_i <= 17:
         ~point += 1
    -else:
        ~point += 2
}
{human_i == human_num:
您目前得分<b>{point}</b>分。
<h4>猛兽级</h4>
->BEAST
}
->HUMAN
= BEAST
VAR beast_num = 22
VAR beast_i = 0
({beast_i+1}/{beast_num})请问您可以接受<b>"{!触手|兽|虫|异形|丸吞|乱交|轮交|扶她|伪娘|机械|滴蜡|鞭打|木马|滥用玩具|洗脑|窒息|妊娠|母|产卵|乳孔|中度殴打|人外(3级)}"</b>吗？
~beast_i++
+ 喜欢
{   beast_i <= 20:
         ~point += 2
    -else:
        ~point += 3
}
{beast_i == beast_num:
您目前得分<b>{point}</b>分。
<h4>异形级</h4>
->SPECIAL
}
->BEAST
+ 接受
{   beast_i <= 20:
         ~point += 1
    -else:
        ~point += 2
}
{beast_i == beast_num:
您目前得分<b>{point}</b>分。
<h4>异形级</h4>
->SPECIAL
}
->BEAST
+ 不接受
{beast_i == beast_num:
您目前得分<b>{point}</b>分。
<h4>异形级</h4>
->SPECIAL
}
->BEAST
+ 无所谓
{   beast_i <= 20:
         ~point += 1
    -else:
        ~point += 2
}
{beast_i == beast_num:
您目前得分<b>{point}</b>分。
<h4>异形级</h4>
->SPECIAL
}
->BEAST

= SPECIAL
VAR special_num = 20
VAR special_i = 0
({special_i+1}/{special_num})请问您可以接受<b>"{!消化|食人|重度殴打|截肢|肉体改造|性器破坏|快感转化|电击|穿刺|砍头|奸尸|肢解|烙铁|贯通|子宫脱|扩张|眼交|脑交|吼交|人外(4级)}"</b>吗？
~special_i++
+ 喜欢
{   special_i <= 19:
         ~point += 3
    -else:
        ~point += 5
}
{special_i == special_num:
->RESULT
}
->SPECIAL
+ 接受
{   special_i <= 19:
         ~point += 2
    -else:
        ~point += 3
}
{special_i == special_num:
->RESULT
}
->SPECIAL
+ 不接受
{special_i == special_num:
->RESULT
}
->SPECIAL
+ 无所谓
{   special_i <= 19:
         ~point += 2
    -else:
        ~point += 3
}
{special_i == special_num:
->RESULT
}
->SPECIAL

=== RESULT ===
<h4>总分：</b>{point}</b>分</h4>
{   point <= 6:
    <h4>绵羊级</h4>
    你对于作品方面的标准仅停留在原始到不能更原始的标准，甚至到了精神洁癖的地步，真的是让人叹为观止。
    ->DONE
}
{   point <= 20:
    <h4>人类级</h4>
    你对于作品的标准，处于一种正常且健康的状态，艺术脱胎于现实而超越现实，你勇敢地在作品中寻找着与现实相互交融而不背离的世界。
    ->DONE
}
{   point <= 60:
    <h4>勇者级</h4>
    现实是场无聊的闹剧，它限制了太多想象与可能性，而你在幻想的世界中自由游荡，作品过激的部分帮你满足现实无法满足的东西。
    ->DONE
}
{   point <= 80:
    <h4>巨龙级</h4>
    正常的作品已经无法满足你，你开始追求那些过于刺激的东西，反正是虚构的，不也挺好的吗。
    ->DONE
}
{   point <= 100:
    <h4>异形级</h4>
    当你凝视深渊的时候，深渊也在凝视着你。
    ->DONE
}
{   point <= 120:
    <h4>恶魔级</h4>
    当你凝视深渊的时候，深渊也看向了你，你们对视了一眼，你脱下了裤子开始打起了飞机，以至于让深渊尴尬地移开了视线。
    ->DONE
}
    <h4>古神级</h4>
    当你凝视深渊的时候，深渊落荒而逃，而你抓住深渊，把它按在了胯下。
->DONE
