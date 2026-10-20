// ==UserScript==
// @name         深渊凝视着你 - 生成总览
// @namespace    dwscdv3
// @version      0.1.1
// @author       Dwscdv3
// @match        *://note.one.rbq.today/xp/*
// @match        *://starinitial.github.io/xpcheck/xp/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // 妈妈，CSS class不能用中文啊
    const transcript = {
        喜欢: 'prefer',
        接受: 'accept',
        不接受: 'reject',
        无所谓: 'neutral',
    };
    const oldColors = {
        喜欢: '#f15390',
        接受: '#b8f1cc',
        不接受: '#ff8444',
        无所谓: '#f1f1b8',
    };
    // rcartocolor - Temps
    const colors = {
        喜欢: '#009392',
        接受: '#9CCB86',
        不接受: '#CF597E',
        无所谓: '#E9E29C',
    };
    let keywords = [];

    const styles = [`.sum { margin: 5px; padding: 4px 8px; border-radius: 5px; color: black; }`];
    for (const key in colors) {
        styles.push(`.sum.${transcript[key]} { background: ${colors[key]}; }`);
        styles.push(`.sum.old${transcript[key]} { background: ${oldColors[key]}; }`);
    }
    $('#story').append(createElement('style', { textContent: styles.join('\n'), attr_id: 'summary-styles' }));
    const observer = new MutationObserver(mutations => {
        for (const mutation of mutations) {
            if (mutation.target.textContent.includes('总分')) {
                observer.disconnect();
                keywords = [...$('#story').querySelectorAll('b')].filter(el => el.textContent.includes('"'));
                $('#story').style.height = '';
                printTable('人类级', 0, 23);
                printTable('猛兽级', 23, 22);
                printTable('异形级', 45, 20);
                printLegend();
                break;
            }
        }
    });
    observer.observe($('#story'), { childList: true });

    function printTable(title, start, length) {
        const elements = [];
        for (let i = start; i < start + length; i++) {
            elements.push(createElement('div', {
                textContent: keywords[i].textContent.trim().replace(/"/g, ''),
                classList: ['sum', transcript[keywords[i].parentNode.nextSibling.textContent.trim()]],
            }));
        }
        $('#story').append(
            _makeHeading(title),
            _makeFlex(elements)
        );
    }
    function _makeHeading(title) {
        return createElement('div', {
            textContent: title,
            styles: {
                textAlign: 'center',
                fontWeight: 'bold',
            },
        })
    }
    function _makeFlex(elements) {
        return createElement('div', {
            styles: {
                display: 'flex',
                maxWidth: '600px',
                margin: '10px',
                flexWrap: 'wrap',
            },
            children: elements,
        })
    }
    function printLegend() {
        const elements = [];
        const oldElements = [];
        for (const key in colors) {
            elements.push(createElement('div', {
                textContent: key,
                classList: ['sum', transcript[key]],
            }));
            oldElements.push(createElement('div', {
                textContent: key,
                classList: ['sum', 'old' + transcript[key]],
            }));
        }
        $('#story').append(_makeHeading('图例'), _makeFlex(elements), _makeHeading('旧图例（用于判读旧版截图）'), _makeFlex(oldElements));
    }

    function $(selector) {
        return document.querySelector(selector);
    }
    function createElement(type, args) {
        const element = document.createElement(type);
        for (const prop in args) {
            const arg = args[prop];
            if (prop === 'classList' && arg instanceof Array) {
                element.classList.add(...arg.filter(cls => cls));
            } else if (prop === 'children' && arg instanceof Array) {
                element.append(...arg.filter(child => child != null));
            } else if (prop === 'styles' && arg instanceof Object) {
                Object.assign(element.style, arg);
            } else if (prop.startsWith('attr_')) {
                element.setAttribute(prop.substring(5), arg);
            } else if (prop.startsWith('on')) {
                element.addEventListener(prop.substring(2), arg);
            } else {
                element[prop] = arg;
            }
        }
        return element;
    }
})();
