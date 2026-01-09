// ==UserScript==
// @name         CATTE BYPASS UI
// @namespace    http://tampermonkey.net/
// @version      3.6
// @author       CATTE
// @match        *://*/*
// @grant        GM_xmlhttpRequest
// @grant        GM_addStyle
// ==/UserScript==

(function() {
    'use strict';

    GM_addStyle(`
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;900&display=swap');
        #catte-panel {
            position: fixed; bottom: 30px; right: 30px; z-index: 999999;
            background: #050505; border: 1px solid #1a1a1a;
            border-radius: 28px; width: 320px; padding: 24px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.9);
            font-family: 'Inter', sans-serif; color: #fff;
            transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
            transform: translateX(150%); opacity: 0;
        }
        #catte-panel.show { transform: translateX(0); opacity: 1; }
        .catte-header { display: flex; align-items: center; gap: 12px; margin-bottom: 20px; }
        .catte-logo { width: 40px; height: 40px; border-radius: 12px; border: 1px solid #222; }
        .catte-title { font-weight: 900; font-size: 18px; letter-spacing: -1px; text-transform: uppercase; }
        .catte-input {
            width: 100%; background: #0c0c0c; border: 1px solid #1a1a1a;
            padding: 14px; border-radius: 16px; color: #fff;
            font-size: 11px; outline: none; margin-bottom: 12px;
            font-family: monospace;
        }
        .catte-btn {
            width: 100%; background: #fff; color: #000; border: none;
            padding: 14px; border-radius: 16px; font-weight: 900;
            font-size: 10px; text-transform: uppercase; cursor: pointer; 
            transition: 0.3s; letter-spacing: 1px;
        }
        .catte-btn:hover { transform: translateY(-2px); background: #e0e0e0; }
        .catte-btn:disabled { opacity: 0.5; cursor: not-allowed; }
        #catte-res-box {
            margin-top: 15px; padding: 15px; background: #0c0c0c;
            border: 1px dashed #333; border-radius: 16px;
            font-size: 11px; word-break: break-all; display: none; 
            cursor: pointer; text-align: center; color: #aaa;
        }
        .catte-launcher {
            position: fixed; bottom: 30px; right: 30px; z-index: 999998;
            background: #fff; color: #000; width: 50px; height: 50px;
            border-radius: 50%; display: flex; align-items: center; justify-content: center;
            cursor: pointer; font-weight: 900; font-size: 14px;
            box-shadow: 0 10px 30px rgba(255,255,255,0.1); transition: 0.3s;
        }
    `);

    const panel = document.createElement('div');
    panel.id = 'catte-panel';
    panel.innerHTML = `
        <div class="catte-header">
            <img class="catte-logo" src="https://raw.githubusercontent.com/LionHub-Pino/Spectre/refs/heads/main/IMG_2059.jpeg">
            <div>
                <div class="catte-title">CATTE</div>
                <div style="font-size: 8px; opacity: 0.3; text-transform: uppercase; font-weight: 800; letter-spacing: 2px;">Bypass System</div>
            </div>
        </div>
        <input type="text" id="catte-url" class="catte-input" placeholder="PASTE LINK HERE..." value="${window.location.href}">
        <button id="catte-exec" class="catte-btn">Bypass Now</button>
        <div id="catte-res-box"></div>
    `;

    const launcher = document.createElement('div');
    launcher.className = 'catte-launcher';
    launcher.innerText = 'CT';

    document.body.appendChild(panel);
    document.body.appendChild(launcher);

    launcher.onclick = () => {
        panel.classList.add('show');
        launcher.style.display = 'none';
    };

    document.addEventListener('mousedown', (e) => {
        if (!panel.contains(e.target) && !launcher.contains(e.target)) {
            panel.classList.remove('show');
            setTimeout(() => { launcher.style.display = 'flex'; }, 300);
        }
    });

    const btn = document.getElementById('catte-exec');
    const resBox = document.getElementById('catte-res-box');
    const urlInput = document.getElementById('catte-url');

    btn.onclick = () => {
        const target = urlInput.value;
        if (!target) return;
        
        btn.innerText = 'Bypassing...';
        btn.disabled = true;
        resBox.style.display = 'none';

        GM_xmlhttpRequest({
            method: "GET",
            url: `https://rough-flower-a9e9.fluxusvip.workers.dev/?url=${encodeURIComponent(target)}`,
            onload: function(response) {
                try {
                    const data = JSON.parse(response.responseText);
                    const result = data.result || data.bypassed_url || data.key || data.data;
                    if (result) {
                        resBox.innerText = result;
                        resBox.style.display = 'block';
                        btn.innerText = 'Success!';
                    } else {
                        resBox.innerText = 'Bypass failed.';
                        resBox.style.display = 'block';
                        btn.innerText = 'Try Again';
                    }
                } catch (e) {
                    resBox.innerText = 'Error response.';
                    resBox.style.display = 'block';
                    btn.innerText = 'Error';
                }
                btn.disabled = false;
            },
            onerror: function() {
                resBox.innerText = 'Connection Error.';
                resBox.style.display = 'block';
                btn.innerText = 'Error';
                btn.disabled = false;
            }
        });
    };

    resBox.onclick = () => {
        navigator.clipboard.writeText(resBox.innerText);
        const oldText = resBox.innerText;
        resBox.innerText = 'COPIED!';
        setTimeout(() => { resBox.innerText = oldText; }, 1000);
    };

})();
