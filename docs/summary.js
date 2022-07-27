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

    const colors = {
        喜欢: '#f15390',
        接受: '#b8f1cc',
        不接受: '#ff8444',
        无所谓: '#f1f1b8',
    };
    let keywords = [];

    const observer = new MutationObserver(mutations => {
        for (const mutation of mutations) {
            if (mutation.target.textContent.includes('总分')) {
                observer.disconnect();
                keywords = [...$('#story').querySelectorAll('b')].filter(el => el.textContent.includes('"'));
                $('#story').style.height = '';
                printTable('人类级', 0, 23);
                printTable('猛兽级', 23, 22);
                printTable('异形级', 45, 20);
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
                styles: {
                    margin: '5px',
                    padding: '4px 8px',
                    background: colors[keywords[i].parentNode.nextSibling.textContent.trim()],
                    borderRadius: '5px',
                },
            }));
        }
        $('#story').append(
            createElement('div', {
                textContent: title,
                styles: {
                    textAlign: 'center',
                    fontWeight: 'bold',
                },
            }),
            createElement('div', {
                styles: {
                    display: 'flex',
                    maxWidth: '600px',
                    margin: '10px',
                    flexWrap: 'wrap',
                },
                children: elements,
            }),
        );
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
