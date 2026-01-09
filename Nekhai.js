// ==UserScript==
// @name         36 Cây Nem chua ( auto bypass nên chỉ cần treo đó 1 tí là xong )
// @namespace    http://tampermonkey.net/
// @version      11.0
// @author       Tz Team
// @match        *://*/*
// @run-at       document-end
// @grant        GM_xmlhttpRequest
// ==/UserScript==

(function() {
    'use strict';

    const WORKER_URL = "https://rough-flower-a9e9.fluxusvip.workers.dev";

    // 1. CSS Giao diện
    const style = document.createElement('style');
    style.innerHTML = `
        #tz-container { position: fixed; top: 15px; left: 50%; transform: translateX(-50%); width: 90%; max-width: 450px; background: #0a0a0a; border: 1px solid #ff3333; border-radius: 12px; padding: 15px; z-index: 9999999; box-shadow: 0 5px 25px rgba(255,51,51,0.3); font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display: none; }
        .tz-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px; }
        .tz-title { color: #ff3333; font-weight: 900; font-size: 16px; letter-spacing: 1px; }
        #tz-status { color: #fff; font-size: 12px; font-weight: 500; }
        .tz-prog-bg { width: 100%; height: 4px; background: #222; border-radius: 5px; overflow: hidden; margin: 8px 0; }
        #tz-bar { width: 0%; height: 100%; background: #ff3333; transition: width 0.4s linear; }
        #tz-result { display: none; background: #151515; border: 1px solid #333; padding: 10px; border-radius: 6px; margin-top: 10px; color: #00ff88; font-family: monospace; cursor: pointer; text-align: center; word-break: break-all; font-size: 13px; }
        .tz-timer-txt { color: #666; font-size: 10px; text-align: center; margin-top: 5px; }
    `;
    document.head.appendChild(style);

    // 2. Tạo UI
    const container = document.createElement('div');
    container.id = 'tz-container';
    container.innerHTML = `
        <div class="tz-header">
            <span class="tz-title">TZ BYPASS</span>
            <span id="tz-status">Đang kiểm tra link...</span>
        </div>
        <div class="tz-prog-bg"><div id="tz-bar"></div></div>
        <div id="tz-result"></div>
        <div id="tz-timer-txt">Dự kiến xong trong: <span id="tz-sec">10</span>s</div>
    `;
    document.body.appendChild(container);

    const bar = document.getElementById('tz-bar');
    const status = document.getElementById('tz-status');
    const secTxt = document.getElementById('tz-sec');
    const resBox = document.getElementById('tz-result');

    // Biến điều khiển
    let timeLeft = 10;
    let progress = 0;
    let isActive = false;

    // Hàm hiển thị UI (chỉ gọi khi cần)
    function showUI() {
        isActive = true;
        container.style.display = 'block';
    }

    // Hàm tự hủy/ẩn nếu không có dữ liệu
    function destroy() {
        container.style.display = 'none';
        container.remove();
    }

    // 3. Tiến trình giả lập (Progress Bar)
    const progressInterval = setInterval(() => {
        if (!isActive) return;
        if (timeLeft > 1) {
            timeLeft--;
            secTxt.innerText = timeLeft;
        }
        if (progress < 95) {
            progress += (95 - progress) * 0.2;
            bar.style.width = progress + "%";
        }
    }, 1000);

    // 4. Gọi API kiểm tra link
    GM_xmlhttpRequest({
        method: "GET",
        url: `${WORKER_URL}/?url=${encodeURIComponent(window.location.href)}`,
        onload: function(response) {
            try {
                const data = JSON.parse(response.responseText);
                const res = data.result || data.bypassed_url;

                // Nếu Server có kết quả bypass hợp lệ
                if (res && !data.error && res !== "Invalid URL" && res !== window.location.href) {
                    showUI(); // Chỉ hiện UI khi thực sự có kết quả
                    clearInterval(progressInterval);
                    bar.style.width = "100%";
                    
                    if (res.startsWith('http')) {
                        status.innerText = "THÀNH CÔNG! ĐANG CHUYỂN HƯỚNG...";
                        status.style.color = "#00ff88";
                        setTimeout(() => window.location.href = res, 1000);
                    } else {
                        status.innerText = "BYPASS XONG! CLICK ĐỂ COPY";
                        status.style.color = "#00ff88";
                        resBox.innerText = res;
                        resBox.style.display = "block";
                        document.getElementById('tz-timer-txt').style.display = 'none';
                        resBox.onclick = () => {
                            navigator.clipboard.writeText(res);
                            status.innerText = "ĐÃ SAO CHÉP!";
                        };
                    }
                } else {
                    // Nếu không phải link cần bypass hoặc lỗi, âm thầm xóa script
                    destroy();
                }
            } catch (e) {
                destroy();
            }
        },
        onerror: () => destroy()
    });
})();
