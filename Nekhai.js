// ==UserScript==
// @name         NEKHAI ĐÁI KHAI - Auto Bypass
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Tự động giải mã link rút gọn qua hệ thống NEKHAI ĐÁI KHAI
// @author       NEKHAI ĐÁI KHAI
// @match        *://*.linkvertise.com/*
// @match        *://*.linkvertise.net/*
// @match        *://*.fluxrealtor.com/*
// @match        *://*.work.ink/*
// @match        *://*.pandadevelopment.net/*
// @match        *://*.key-system.org/*
// @grant        GM_xmlhttpRequest
// @run-at       document-start
// ==/UserScript==

(function() {
    'use strict';

    // ĐỊA CHỈ WEB WORKER CỦA BẠN (Thay bằng link worker của bạn)
    const YOUR_WORKER_URL = "https://your-worker-name.workers.dev";

    const currentUrl = window.location.href;

    // Chặn chuyển hướng quảng cáo và gửi link đi bypass
    if (currentUrl.includes("linkvertise") || currentUrl.includes("work.ink") || currentUrl.includes("flux")) {
        console.log("NEKHAI ĐÁI KHAI: Đang xử lý link...");
        
        // Chuyển hướng người dùng về trang của bạn kèm tham số link
        window.location.href = `${YOUR_WORKER_URL}/?url=${encodeURIComponent(currentUrl)}`;
    }
})();
