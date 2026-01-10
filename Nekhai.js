// ==UserScript==
// @name         CATTE BYPASS UI - V2
// @namespace    http://tampermonkey.net/
// @version      2.6
// @description  Bypass UI CATTE
// @author       CATTE & 36THANHHOA
// @match        *://*/*
// @grant        GM_xmlhttpRequest
// @grant        GM_addStyle
// @grant        GM_setValue
// @grant        GM_getValue
// ==/UserScript==

(function() {
    'use strict';

    const WORKER_URL = "https://raumaapi.fluxusvip.workers.dev";

    GM_addStyle(`
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap');
        #catte-panel { position: fixed; bottom: 30px; right: 30px; z-index: 2147483647 !important; background: #050505; border: 1px solid #1a1a1a; border-radius: 28px; width: 320px; padding: 24px; box-shadow: 0 20px 50px rgba(0,0,0,0.9); font-family: 'Inter', sans-serif; color: #fff; transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1); transform: translateX(150%); opacity: 0; }
        #catte-panel.show { transform: translateX(0); opacity: 1; }
        .catte-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; }
        .catte-header-left { display: flex; align-items: center; gap: 12px; }
        .catte-logo { width: 40px; height: 40px; border-radius: 12px; border: 1px solid #222; }
        .catte-title { font-weight: 900; font-size: 18px; letter-spacing: -1px; text-transform: uppercase; }
        .catte-input { width: 100%; background: #0c0c0c; border: 1px solid #1a1a1a; padding: 12px; border-radius: 12px; color: #fff; font-size: 11px; outline: none; margin-bottom: 8px; font-family: monospace; }
        #catte-key-container { display: block; }
        #catte-key-container.hidden { display: none; }
        .catte-btn { width: 100%; background: #fff; color: #000; border: none; padding: 14px; border-radius: 16px; font-weight: 900; font-size: 10px; text-transform: uppercase; cursor: pointer; transition: 0.3s; letter-spacing: 1px; }
        .catte-btn:hover { transform: translateY(-2px); }
        .catte-option { display: flex; align-items: center; justify-content: space-between; margin: 10px 0; font-size: 10px; font-weight: 800; color: #666; text-transform: uppercase; }
        .switch { position: relative; display: inline-block; width: 34px; height: 20px; }
        .switch input { opacity: 0; width: 0; height: 0; }
        .slider { position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0; background-color: #1a1a1a; transition: .4s; border-radius: 20px; }
        .slider:before { position: absolute; content: ""; height: 14px; width: 14px; left: 3px; bottom: 3px; background-color: #444; transition: .4s; border-radius: 50%; }
        input:checked + .slider { background-color: #fff; }
        input:checked + .slider:before { transform: translateX(14px); background-color: #000; }
        #catte-res-box { margin-top: 15px; padding: 15px; background: #0c0c0c; border: 1px dashed #333; border-radius: 16px; font-size: 11px; word-break: break-all; display: none; cursor: pointer; text-align: center; color: #aaa; }
        .reset-key-btn { font-size: 8px; color: #444; cursor: pointer; text-decoration: underline; }
        .reset-key-btn:hover { color: #ff3333; }
        .catte-launcher { position: fixed; bottom: 30px; right: 30px; z-index: 2147483646 !important; background: #fff; color: #000; width: 50px; height: 50px; border-radius: 50%; display: flex; align-items: center; justify-content: center; cursor: pointer; font-weight: 900; }
    `);

    const panel = document.createElement('div');
    panel.id = 'catte-panel';
    let savedKey = GM_getValue("catte_key", "");
    const autoStatus = GM_getValue("catte_auto", false);

    panel.innerHTML = `
        <div class="catte-header">
            <div class="catte-header-left">
                <img class="catte-logo" src="https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/IMG_2059.jpeg">
                <div>
                    <div class="catte-title">CATTE</div>
                    <div style="font-size: 8px; opacity: 0.3; text-transform: uppercase; font-weight: 800; letter-spacing: 2px;">Bypass System</div>
                </div>
            </div>
            <span class="reset-key-btn" id="catte-reset-key">RESET KEY</span>
        </div>
        <div id="catte-key-container" class="${savedKey ? 'hidden' : ''}">
            <input type="text" id="catte-user-key" class="catte-input" placeholder="ENTER ACCESS KEY..." value="${savedKey}">
        </div>
        <input type="text" id="catte-url" class="catte-input" placeholder="PASTE LINK HERE..." value="${window.location.href}">
        <div class="catte-option">
            <span>Auto Bypass</span>
            <label class="switch">
                <input type="checkbox" id="catte-auto-sw" ${autoStatus ? 'checked' : ''}>
                <span class="slider"></span>
            </label>
        </div>
        <button id="catte-exec" class="catte-btn">Bypass Now</button>
        <div id="catte-res-box"></div>
    `;

    const launcher = document.createElement('div');
    launcher.className = 'catte-launcher';
    launcher.innerText = 'CT';
    document.body.appendChild(panel);
    document.body.appendChild(launcher);

    const btn = document.getElementById('catte-exec');
    const resBox = document.getElementById('catte-res-box');
    const keyContainer = document.getElementById('catte-key-container');
    const keyInput = document.getElementById('catte-user-key');
    const resetKey = document.getElementById('catte-reset-key');

    resetKey.onclick = () => { keyContainer.classList.remove('hidden'); keyInput.focus(); };
    launcher.onclick = () => { panel.classList.add('show'); launcher.style.display = 'none'; };
    
    document.addEventListener('mousedown', (e) => {
        if (!panel.contains(e.target) && !launcher.contains(e.target)) {
            panel.classList.remove('show');
            setTimeout(() => { launcher.style.display = 'flex'; }, 300);
        }
    });

    function doBypass() {
        const target = document.getElementById('catte-url').value;
        const key = keyInput.value.trim();
        if (!key) { keyContainer.classList.remove('hidden'); alert("Vui lòng nhập Key!"); return; }
        GM_setValue("catte_key", key);
        keyContainer.classList.add('hidden');
        btn.innerText = 'Bypassing...';
        btn.disabled = true;
        GM_xmlhttpRequest({
            method: "GET",
            url: `${WORKER_URL}/api/bypass?url=${encodeURIComponent(target)}`,
            headers: { "x-user-key": key },
            onload: function(response) {
                if (response.status === 401) {
                    resBox.innerText = 'SAI KEY RỒI BRO!';
                    resBox.style.display = 'block';
                    keyContainer.classList.remove('hidden');
                } else {
                    try {
                        const data = JSON.parse(response.responseText);
                        const result = data.result || data.bypassed_url;
                        if (result) {
                            resBox.innerText = result;
                            resBox.style.display = 'block';
                            btn.innerText = 'Success!';
                            if (document.getElementById('catte-auto-sw').checked && result.startsWith('http')) {
                                window.location.href = result;
                            }
                        }
                    } catch (e) { resBox.innerText = 'Error API.'; resBox.style.display = 'block'; }
                }
                btn.disabled = false;
                if (btn.innerText !== 'Success!') btn.innerText = 'Bypass Now';
            }
        });
    }

    btn.onclick = doBypass;
    document.getElementById('catte-auto-sw').onchange = (e) => GM_setValue("catte_auto", e.target.checked);
    if (autoStatus && savedKey) { panel.classList.add('show'); launcher.style.display = 'none'; setTimeout(doBypass, 1000); }

    resBox.onclick = () => {
        navigator.clipboard.writeText(resBox.innerText);
        const t = resBox.innerText;
        resBox.innerText = 'COPIED!';
        setTimeout(() => { resBox.innerText = t; }, 1000);
    };
})();
