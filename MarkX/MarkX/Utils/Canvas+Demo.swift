//
//  Canvas+Demo.swift
//  MarkX
//
//  Created by Dongyu Zhao on 6/18/25.
//

extension Canvas {
    static let weatherApplePark = """
        <!DOCTYPE html>
        <html lang="zh-CN">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>天气卡片 — 10天滚动示例</title>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; }
            html, body { width:100%; height:100%; }
            body {
              display: flex; justify-content: center; align-items: center;
              font-family: -apple-system, "Helvetica Neue", Arial, sans-serif;
            }

            .weather-card {
              position: relative;
              width: 100%;
              overflow: hidden;
              border-radius: 32px;
              display: flex; flex-direction: column;
              background: linear-gradient(135deg, #e0eafc 0%, #cfdef3 100%);
            }

            .weather-header {
              flex: 1; padding: 32px; color: #1c1c1e;
            }
            .weather-header .location { font-size: 16px; font-weight: 600; }
            .weather-header .condition { margin-top: 4px; font-size: 14px; opacity: 0.8; }
            .weather-header .current-temp { margin-top: 16px; font-size: 72px; font-weight: 700; line-height: 1; }
            .weather-header .high-low { margin-top: 8px; font-size: 16px; opacity: 0.8; }
            .weather-header .art {
              position: absolute; right: -20%; bottom: -20%;
              width: 150%; height: 150%;
              background: radial-gradient(circle at 50% 50%, rgba(255,235,59,0.8) 0%, rgba(255,235,59,0) 70%);
              border-radius: 50%; pointer-events: none;
            }
            .weather-header .birds {
              position: absolute; right: 10%; top: 20%;
              font-size: 20px; opacity: 0.6; transform: rotate(-10deg); white-space: nowrap;
            }

            .weather-forecast {
              background: #fff;
              padding: 16px 8px;
              display: flex;
              overflow-x: auto;
              scrollbar-width: thin;
              scrollbar-color: #ccc transparent;
              border-top-left-radius: 24px;
              border-top-right-radius: 24px;
              box-shadow: 0 -2px 8px rgba(0,0,0,0.05);
            }
            .weather-forecast::-webkit-scrollbar { height: 6px; }
            .weather-forecast::-webkit-scrollbar-thumb { background: #ccc; border-radius: 3px; }

            .forecast-item {
              flex: 0 0 auto;
              width: 64px;
              text-align: center;
              margin: 0 8px;
            }
            .forecast-item .day { font-size: 14px; color: #333; }
            .forecast-item .icon {
              margin: 8px 0;
              width: 48px; height: 48px;
              border-radius: 50%;
              background: radial-gradient(circle at 30% 30%, #ffd54f 0%, #ffc107 80%);
            }
            .forecast-item .hi-lo {
              font-size: 13px;
              color: #666;
              line-height: 1.2;
            }
          </style>
        </head>
        <body>
          <div class="weather-card">

            <div class="weather-header">
              <div class="location">苹果园区, 加利福尼亚, 美国 · 现在</div>
              <div class="condition">晴朗</div>
              <div class="current-temp">14°C</div>
              <div class="high-low">↑29°  ↓12°</div>
              <div class="art"></div>
              <div class="birds">🕊️🕊️🕊️</div>
            </div>

            <div class="weather-forecast">
              <!-- 10 天示例 -->
              <div class="forecast-item">
                <div class="day">Today</div>
                <div class="icon"></div>
                <div class="hi-lo">29°<br>12°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Thu</div>
                <div class="icon"></div>
                <div class="hi-lo">23°<br>11°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Fri</div>
                <div class="icon"></div>
                <div class="hi-lo">22°<br>11°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Sat</div>
                <div class="icon"></div>
                <div class="hi-lo">23°<br>11°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Sun</div>
                <div class="icon"></div>
                <div class="hi-lo">26°<br>12°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Mon</div>
                <div class="icon"></div>
                <div class="hi-lo">26°<br>13°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Tue</div>
                <div class="icon"></div>
                <div class="hi-lo">25°<br>12°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Wed</div>
                <div class="icon"></div>
                <div class="hi-lo">28°<br>12°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Thu</div>
                <div class="icon"></div>
                <div class="hi-lo">28°<br>13°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Fri</div>
                <div class="icon"></div>
                <div class="hi-lo">30°<br>14°</div>
              </div>
            </div>

          </div>
        </body>
        </html>
        """

    static let weatherDC = """
                <!DOCTYPE html>
                <html lang="zh-CN">
                <head>
                  <meta charset="UTF-8">
                  <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  <title>华盛顿天气卡片</title>
                  <style>
                    * { box-sizing: border-box; margin: 0; padding: 0; }
                    html, body { width: 100%; height: 100%; }
                    body {
                      display: flex; align-items: center; justify-content: center;
                      font-family: -apple-system, "Helvetica Neue", Arial, sans-serif;
                    }

                    .weather-card {
                      position: relative;
                      width: 100%;
                      border-radius: 32px;
                      overflow: hidden;
                      display: flex; flex-direction: column;
                      background: #c8dce7;
                    }

                    /* —— Header —— */
                    .weather-header {
                      position: relative;
                      flex: 1;
                      padding: 32px;
                      color: #1c1c1e;
                    }
                    .weather-header .location {
                      font-size: 16px; font-weight: 600;
                    }
                    .weather-header .condition {
                      margin-top: 4px; font-size: 14px; opacity: 0.8;
                    }
                    .weather-header .current-temp {
                      margin-top: 16px; font-size: 72px; font-weight: 700; line-height: 1;
                    }
                    .weather-header .high-low {
                      margin-top: 8px; font-size: 16px; opacity: 0.8;
                    }

                    /* —— Raindrops Animation —— */
                    .rain {
                      position: absolute; top: 0; left: 0;
                      width: 100%; height: 100%;
                      pointer-events: none; overflow: hidden;
                    }
                    .rain .drop {
                      position: absolute;
                      top: -10px;
                      width: 2px; height: 15px;
                      background: rgba(255,255,255,0.7);
                      animation: drop linear infinite;
                    }
                    @keyframes drop {
                      to { transform: translateY(120%); }
                    }

                    /* Create many drops with varied positions/durations */
                    .rain .drop:nth-child(1)  { left: 10%;  animation-duration: 0.6s; animation-delay: 0s; }
                    .rain .drop:nth-child(2)  { left: 25%;  animation-duration: 0.8s; animation-delay: 0.2s; }
                    .rain .drop:nth-child(3)  { left: 40%;  animation-duration: 0.5s; animation-delay: 0.1s; }
                    .rain .drop:nth-child(4)  { left: 55%;  animation-duration: 0.7s; animation-delay: 0.3s; }
                    .rain .drop:nth-child(5)  { left: 70%;  animation-duration: 0.9s; animation-delay: 0.4s; }
                    .rain .drop:nth-child(6)  { left: 85%;  animation-duration: 0.6s; animation-delay: 0.5s; }
                    .rain .drop:nth-child(7)  { left: 30%;  animation-duration: 0.8s; animation-delay: 0.6s; }
                    .rain .drop:nth-child(8)  { left: 60%;  animation-duration: 0.5s; animation-delay: 0.7s; }
                    .rain .drop:nth-child(9)  { left: 90%;  animation-duration: 0.7s; animation-delay: 0.8s; }

                    /* —— Umbrella Image —— */
                    .umbrella {
                      position: absolute;
                      right: -20px;
                      bottom: -20px;
                      width: 180px;
                      pointer-events: none;
                      opacity: 0.8;
                    }

                    /* —— Forecast Strip —— */
                    .weather-forecast {
                      background: #f9fbfd;
                      padding: 16px 8px;
                      display: flex; overflow-x: auto;
                      border-top-left-radius: 24px;
                      border-top-right-radius: 24px;
                      box-shadow: 0 -2px 8px rgba(0,0,0,0.05);
                    }
                    .weather-forecast::-webkit-scrollbar { height: 6px; }
                    .weather-forecast::-webkit-scrollbar-thumb { background: #ccc; border-radius: 3px; }

                    .forecast-item {
                      flex: 0 0 auto;
                      width: 64px;
                      text-align: center;
                      margin: 0 8px;
                      font-size: 14px;
                      color: #333;
                    }
                    .forecast-item .icon {
                      margin: 8px 0;
                      width: 48px; height: 48px;
                      display: inline-block;
                    }
                    /* Rainy SVG icon */
                    .forecast-item.rainy .icon {
                      background: none;
                    }
                    .forecast-item.rainy .icon svg {
                      width: 100%; height: 100%;
                    }
                    /* Sunny circle */
                    .forecast-item.sunny .icon {
                      background: radial-gradient(circle at 30% 30%, #ffd54f 0%, #ffc107 80%);
                      border-radius: 50%;
                    }
                    .forecast-item .hi-lo {
                      font-size: 13px; color: #666; line-height: 1.2;
                    }
                  </style>
                </head>
                <body>

                  <div class="weather-card">
                    <div class="weather-header">
                      <div class="location">华盛顿, 哥伦比亚特区, 美国 · 现在</div>
                      <div class="condition">多云</div>
                      <div class="current-temp">23°C</div>
                      <div class="high-low">↑32° &nbsp; ↓23°</div>

                      <div class="rain">
                        <!-- generate 9 drops -->
                        <div class="drop"></div><div class="drop"></div><div class="drop"></div>
                        <div class="drop"></div><div class="drop"></div><div class="drop"></div>
                        <div class="drop"></div><div class="drop"></div><div class="drop"></div>
                      </div>

                      <!-- 请将 umbrella.png 替换为你的伞图路径 -->
                      <img src="umbrella.png" alt="" class="umbrella">
                    </div>

                    <div class="weather-forecast">
                      <!-- 9-day forecast -->
                      <div class="forecast-item rainy">
                        <div class="day">Today</div>
                        <div class="icon">
                          <svg viewBox="0 0 64 64"><ellipse cx="32" cy="28" rx="16" ry="10" fill="#fff"/><line x1="28" y1="40" x2="28" y2="48" stroke="#4FC3F7" stroke-width="2"/><line x1="36" y1="40" x2="36" y2="48" stroke="#4FC3F7" stroke-width="2"/></svg>
                        </div>
                        <div class="hi-lo">32°<br>23°</div>
                      </div>
                      <div class="forecast-item rainy">
                        <div class="day">Thu</div>
                        <div class="icon">
                          <svg viewBox="0 0 64 64"><ellipse cx="32" cy="28" rx="16" ry="10" fill="#fff"/><line x1="28" y1="40" x2="28" y2="48" stroke="#4FC3F7" stroke-width="2"/><line x1="36" y1="40" x2="36" y2="48" stroke="#4FC3F7" stroke-width="2"/></svg>
                        </div>
                        <div class="hi-lo">33°<br>21°</div>
                      </div>
                      <!-- Sunny days -->
                      <div class="forecast-item sunny">
                        <div class="day">Fri</div>
                        <div class="icon"></div>
                        <div class="hi-lo">30°<br>21°</div>
                      </div>
                      <div class="forecast-item sunny">
                        <div class="day">Sat</div>
                        <div class="icon"></div>
                        <div class="hi-lo">32°<br>24°</div>
                      </div>
                      <div class="forecast-item sunny">
                        <div class="day">Sun</div>
                        <div class="icon"></div>
                        <div class="hi-lo">34°<br>25°</div>
                      </div>
                      <div class="forecast-item sunny">
                        <div class="day">Mon</div>
                        <div class="icon"></div>
                        <div class="hi-lo">36°<br>26°</div>
                      </div>
                      <div class="forecast-item sunny">
                        <div class="day">Tue</div>
                        <div class="icon"></div>
                        <div class="hi-lo">37°<br>26°</div>
                      </div>
                      <div class="forecast-item sunny">
                        <div class="day">Wed</div>
                        <div class="icon"></div>
                        <div class="hi-lo">36°<br>25°</div>
                      </div>
                      <div class="forecast-item sunny">
                        <div class="day">Thu</div>
                        <div class="icon"></div>
                        <div class="hi-lo">35°<br>26°</div>
                      </div>
                    </div>
                  </div>

                </body>
                </html>
        """

    static let weatherYosemite = """
        <!DOCTYPE html>
        <html lang="zh-CN">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>天气卡片 — 优胜美地国家公园</title>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; }
            html, body { width:100%; height:100%; }
            body {
              display: flex; justify-content: center; align-items: center;
              font-family: -apple-system, "Helvetica Neue", Arial, sans-serif;
            }

            .weather-card {
              position: relative;
              width: 100%;
              overflow: hidden;
              border-radius: 32px;
              display: flex; flex-direction: column;
              background: linear-gradient(135deg, #e0eafc 0%, #cfdef3 100%);
            }

            /* —— 头部区域 —— */
            .weather-header {
              position: relative;
              flex: 1;
              padding: 32px;
              color: #1c1c1e;
            }
            .weather-header .location {
              font-size: 16px; font-weight: 600;
            }
            .weather-header .condition {
              margin-top: 4px; font-size: 14px; opacity: 0.8;
            }
            .weather-header .current-temp {
              margin-top: 16px; font-size: 72px; font-weight: 700; line-height: 1;
            }
            .weather-header .high-low {
              margin-top: 8px; font-size: 16px; opacity: 0.8;
            }
            /* 太阳光晕 */
            .weather-header .art {
              position: absolute;
              right: -25%;
              bottom: -25%;
              width: 150%; height: 150%;
              background: radial-gradient(circle at 50% 50%, rgba(255,235,59,0.8) 0%, rgba(255,235,59,0) 70%);
              border-radius: 50%;
              pointer-events: none;
            }
            /* 飞鸟点缀 */
            .weather-header .birds {
              position: absolute;
              right: 8%;
              top: 20%;
              font-size: 18px;
              opacity: 0.6;
              transform: rotate(-10deg);
              white-space: nowrap;
            }

            /* —— 底部未来预报 —— */
            .weather-forecast {
              background: #ffffff;
              padding: 16px 8px;
              display: flex;
              overflow-x: auto;
              border-top-left-radius: 24px;
              border-top-right-radius: 24px;
              box-shadow: 0 -2px 8px rgba(0,0,0,0.05);
            }
            .weather-forecast::-webkit-scrollbar { height: 6px; }
            .weather-forecast::-webkit-scrollbar-thumb { background: #ccc; border-radius: 3px; }

            .forecast-item {
              flex: 0 0 auto;
              width: 64px;
              text-align: center;
              margin: 0 8px;
              font-size: 14px;
              color: #333;
            }
            .forecast-item .day {
              font-size: 14px;
              margin-bottom: 6px;
            }
            .forecast-item .icon {
              width: 48px; height: 48px;
              margin: 0 auto 8px;
              border-radius: 50%;
              background: radial-gradient(circle at 30% 30%, #ffd54f 0%, #ffc107 80%);
            }
            .forecast-item .hi-lo {
              font-size: 13px;
              color: #666;
              line-height: 1.2;
            }
          </style>
        </head>
        <body>

          <div class="weather-card">
            <div class="weather-header">
              <div class="location">优胜美地国家公园, 加利福尼亚, 美国 · 现在</div>
              <div class="condition">晴朗</div>
              <div class="current-temp">12°C</div>
              <div class="high-low">↑22°  ↓6°</div>
              <div class="art"></div>
              <div class="birds">🕊️🕊️🕊️</div>
            </div>

            <div class="weather-forecast">
              <div class="forecast-item">
                <div class="day">Today</div>
                <div class="icon"></div>
                <div class="hi-lo">22°<br>6°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Thu</div>
                <div class="icon"></div>
                <div class="hi-lo">26°<br>4°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Fri</div>
                <div class="icon"></div>
                <div class="hi-lo">20°<br>1°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Sat</div>
                <div class="icon"></div>
                <div class="hi-lo">16°<br>-1°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Sun</div>
                <div class="icon"></div>
                <div class="hi-lo">18°<br>1°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Mon</div>
                <div class="icon"></div>
                <div class="hi-lo">20°<br>4°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Tue</div>
                <div class="icon"></div>
                <div class="hi-lo">20°<br>4°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Wed</div>
                <div class="icon"></div>
                <div class="hi-lo">24°<br>6°</div>
              </div>
              <div class="forecast-item">
                <div class="day">Thu</div>
                <div class="icon"></div>
                <div class="hi-lo">26°<br>8°</div>
              </div>
            </div>
          </div>

        </body>
        </html>
        """

    static let weatherMadison = """
        <!DOCTYPE html>
        <html lang="zh-CN">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>天气卡片 — 麦迪逊</title>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; }
            html, body { width:100%; height:100%; }
            body {
              font-family: -apple-system, "Helvetica Neue", Arial, sans-serif;
            }
            .weather-card {
              position: relative;
              width: 100%;
              border-radius: 32px;
              overflow: hidden;
              display: flex; flex-direction: column;
              background: linear-gradient(135deg, #e0eafc 0%, #cfdef3 100%);
            }
            /* —— 头部 —— */
            .weather-header {
              position: relative; flex: 1; padding: 32px; color: #1c1c1e;
            }
            .weather-header .location {
              font-size: 16px; font-weight: 600;
            }
            .weather-header .condition {
              margin-top: 4px; font-size: 14px; opacity: 0.8;
            }
            .weather-header .current-temp {
              margin-top: 16px; font-size: 72px; font-weight: 700; line-height: 1;
            }
            .weather-header .high-low {
              margin-top: 8px; font-size: 16px; opacity: 0.8;
            }
            /* —— 雨滴动画 —— */
            .weather-header .rain {
              position: absolute; top: 0; left: 0;
              width: 100%; height: 100%;
              pointer-events: none; overflow: hidden;
            }
            .weather-header .rain .drop {
              position: absolute; top: -10px;
              width: 2px; height: 15px;
              background: rgba(255,255,255,0.7);
              animation: drop linear infinite;
            }
            @keyframes drop { to { transform: translateY(120%); } }
            /* 不同滴的位置和速度 */
            .rain .drop:nth-child(1)  { left: 10%;  animation-duration: 0.6s; animation-delay: 0s; }
            .rain .drop:nth-child(2)  { left: 25%;  animation-duration: 0.8s; animation-delay: 0.2s; }
            .rain .drop:nth-child(3)  { left: 40%;  animation-duration: 0.5s; animation-delay: 0.1s; }
            .rain .drop:nth-child(4)  { left: 55%;  animation-duration: 0.7s; animation-delay: 0.3s; }
            .rain .drop:nth-child(5)  { left: 70%;  animation-duration: 0.9s; animation-delay: 0.4s; }
            .rain .drop:nth-child(6)  { left: 85%;  animation-duration: 0.6s; animation-delay: 0.5s; }
            .rain .drop:nth-child(7)  { left: 30%;  animation-duration: 0.8s; animation-delay: 0.6s; }
            .rain .drop:nth-child(8)  { left: 60%;  animation-duration: 0.5s; animation-delay: 0.7s; }
            .rain .drop:nth-child(9)  { left: 90%;  animation-duration: 0.7s; animation-delay: 0.8s; }

            /* —— 预报横条 —— */
            .weather-forecast {
              background: #f9fbfd;
              padding: 16px 8px;
              display: flex; overflow-x: auto;
              border-top-left-radius: 24px;
              border-top-right-radius: 24px;
              box-shadow: 0 -2px 8px rgba(0,0,0,0.05);
            }
            .weather-forecast::-webkit-scrollbar { height: 6px; }
            .weather-forecast::-webkit-scrollbar-thumb { background: #ccc; border-radius: 3px; }
            .forecast-item {
              flex: 0 0 auto; width: 64px;
              text-align: center; margin: 0 8px; color: #333;
            }
            .forecast-item .day {
              font-size: 14px; margin-bottom: 6px;
            }
            .forecast-item .icon {
              width: 48px; height: 48px; margin: 0 auto 8px;
              display: inline-block; border-radius: 50%;
            }
            /* 晴天图标 */
            .forecast-item.sunny .icon {
              background: radial-gradient(circle at 30% 30%, #ffd54f 0%, #ffc107 80%);
            }
            /* 阴雨图标 */
            .forecast-item.rainy .icon {
              background: none;
            }
            .forecast-item.rainy .icon svg {
              width: 100%; height: 100%;
            }
            .forecast-item .hi-lo {
              font-size: 13px; color: #666; line-height: 1.2;
            }
          </style>
        </head>
        <body>

          <div class="weather-card">
            <div class="weather-header">
              <div class="location">麦迪逊, 威斯康辛, 美国 · 现在</div>
              <div class="condition">阴</div>
              <div class="current-temp">20°C</div>
              <div class="high-low">↑23°  ↓18°</div>

              <div class="rain">
                <div class="drop"></div><div class="drop"></div><div class="drop"></div>
                <div class="drop"></div><div class="drop"></div><div class="drop"></div>
                <div class="drop"></div><div class="drop"></div><div class="drop"></div>
              </div>
            </div>

            <div class="weather-forecast">
              <div class="forecast-item rainy">
                <div class="day">Today</div>
                <div class="icon">
                  <svg viewBox="0 0 64 64"><ellipse cx="32" cy="28" rx="16" ry="10" fill="#fff"/><line x1="28" y1="40" x2="28" y2="48" stroke="#4FC3F7" stroke-width="2"/><line x1="36" y1="40" x2="36" y2="48" stroke="#4FC3F7" stroke-width="2"/></svg>
                </div>
                <div class="hi-lo">23°<br>18°</div>
              </div>
              <div class="forecast-item sunny">
                <div class="day">Thu</div>
                <div class="icon"></div>
                <div class="hi-lo">28°<br>20°</div>
              </div>
              <div class="forecast-item rainy">
                <div class="day">Fri</div>
                <div class="icon">
                  <svg viewBox="0 0 64 64"><ellipse cx="32" cy="28" rx="16" ry="10" fill="#fff"/><line x1="28" y1="40" x2="28" y2="48" stroke="#4FC3F7" stroke-width="2"/><line x1="36" y1="40" x2="36" y2="48" stroke="#4FC3F7" stroke-width="2"/></svg>
                </div>
                <div class="hi-lo">28°<br>25°</div>
              </div>
              <div class="forecast-item sunny">
                <div class="day">Sat</div>
                <div class="icon"></div>
                <div class="hi-lo">34°<br>26°</div>
              </div>
              <div class="forecast-item sunny">
                <div class="day">Sun</div>
                <div class="icon"></div>
                <div class="hi-lo">34°<br>26°</div>
              </div>
              <div class="forecast-item sunny">
                <div class="day">Mon</div>
                <div class="icon"></div>
                <div class="hi-lo">33°<br>24°</div>
              </div>
              <div class="forecast-item rainy">
                <div class="day">Tue</div>
                <div class="icon">
                  <svg viewBox="0 0 64 64"><ellipse cx="32" cy="28" rx="16" ry="10" fill="#fff"/><line x1="28" y1="40" x2="28" y2="48" stroke="#4FC3F7" stroke-width="2"/><line x1="36" y1="40" x2="36" y2="48" stroke="#4FC3F7" stroke-width="2"/></svg>
                </div>
                <div class="hi-lo">31°<br>18°</div>
              </div>
              <div class="forecast-item rainy">
                <div class="day">Wed</div>
                <div class="icon">
                  <svg viewBox="0 0 64 64"><ellipse cx="32" cy="28" rx="16" ry="10" fill="#fff"/><line x1="28" y1="40" x2="28" y2="48" stroke="#4FC3F7" stroke-width="2"/><line x1="36" y1="40" x2="36" y2="48" stroke="#4FC3F7" stroke-width="2"/></svg>
                </div>
                <div class="hi-lo">25°<br>19°</div>
              </div>
              <div class="forecast-item rainy">
                <div class="day">Thu</div>
                <div class="icon">
                  <svg viewBox="0 0 64 64"><ellipse cx="32" cy="28" rx="16" ry="10" fill="#fff"/><line x1="28" y1="40" x2="28" y2="48" stroke="#4FC3F7" stroke-width="2"/><line x1="36" y1="40" x2="36" y2="48" stroke="#4FC3F7" stroke-width="2"/></svg>
                </div>
                <div class="hi-lo">29°<br>20°</div>
              </div>
            </div>
          </div>

        </body>
        </html>
        """

    static let stockApple = """
        <!DOCTYPE html>
        <html lang="zh-CN">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <title>股票卡片 — Apple Inc (AAPL)</title>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0 }
            html, body { width: 100%; height: 100% }
            body {
              display: flex;
              align-items: center;
              justify-content: center;
              font-family: -apple-system, "Helvetica Neue", Arial, sans-serif;
            }

            .stock-card {
              width: 100%;
              border-radius: 32px;
              background: #fff;
              overflow: hidden;
              box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }
            .stock-header {
              padding: 24px;
            }
            .stock-header .title {
              font-size: 20px; font-weight: 700;
            }
            .stock-header .symbol {
              font-weight: 400; color: #666;
              margin-left: 4px;
            }
            .stock-header .subtitle {
              margin-top: 4px;
              font-size: 14px; color: #888;
            }

            .price-line {
              display: flex; align-items: baseline;
              margin-top: 16px;
            }
            .price-line .price {
              font-size: 48px; font-weight: 700;
              line-height: 1;
            }
            .price-line .unit {
              margin-left: 4px;
              font-size: 18px; color: #666;
            }

            .change {
              margin-top: 8px;
              font-size: 16px;
            }
            .change.negative { color: #C0392B }
            .change.positive { color: #27AE60 }
            .change .after { margin-left: 16px; font-size: 14px; color: #666 }

            .tabs {
              display: flex;
              padding: 16px 24px 0;
              gap: 16px;
            }
            .tabs li {
              list-style: none;
              padding: 8px 12px;
              border-radius: 16px;
              cursor: pointer;
              font-size: 14px;
              color: #666;
            }
            .tabs li.active {
              background: #eee;
              color: #333;
            }

            .chart-container {
              position: relative;
              padding: 0 24px;
              margin-top: 16px;
            }
            .chart-container svg {
              width: 100%; height: 200px;
              overflow: visible;
            }

            /* 下方指标网格 */
            .stats {
              display: grid;
              grid-template-columns: repeat(3, 1fr);
              gap: 0;
              padding: 24px;
              border-top: 1px solid #f0f0f0;
            }
            .stat {
              display: flex;
              flex-direction: column;
              gap: 12px;
            }
            .stat .label {
              font-size: 14px;
              color: #888;
            }
            .stat .value {
              font-size: 16px;
              font-weight: 600;
              color: #333;
            }
          </style>
        </head>
        <body>

          <div class="stock-card">

            <!-- 头部信息 -->
            <div class="stock-header">
              <div class="title">
                Apple Inc<span class="symbol">(AAPL)</span>
              </div>
              <div class="subtitle">
                6月17日 GMT-4 下午07:59 · 股市收盘
              </div>

              <div class="price-line">
                <div class="price">195.64</div>
                <div class="unit">USD</div>
              </div>
              <div class="change negative">
                -2.78 (-1.40%) 今天
                <span class="after">
                  盘后 195.20 USD -0.44 (-0.22%)
                </span>
              </div>

              <ul class="tabs">
                <li class="active">1日</li>
                <li>5日</li>
                <li>1个月</li>
                <li>1年</li>
                <li>5年</li>
                <li>最大值</li>
              </ul>
            </div>

            <!-- 曲线图 -->
            <div class="chart-container">
              <svg viewBox="0 0 600 250" preserveAspectRatio="none">
                <defs>
                  <!-- 红色渐变面积 -->
                  <linearGradient id="grad-day" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="0%" stop-color="rgba(231,76,60,0.4)"/>
                    <stop offset="100%" stop-color="rgba(231,76,60,0)"/>
                  </linearGradient>
                  <!-- 盘后斜线填充 -->
                  <pattern id="hatch" patternUnits="userSpaceOnUse" width="6" height="6"
                           patternTransform="rotate(45)">
                    <line x1="0" y1="0" x2="0" y2="6" stroke="#ccc" stroke-width="1"/>
                  </pattern>
                </defs>

                <!-- 日间成交区域 -->
                <path d="
                  M0,200
                  L50,180 L100,150 L150,160 L200,140
                  L250,130 L300,120 L350,100 L400,110
                  L450,105 L500,95  L550,100 L600,90
                  L600,250 L0,250 Z"
                  fill="url(#grad-day)" stroke="none"/>

                <!-- 日间折线 -->
                <polyline
                  fill="none"
                  stroke="#E74C3C"
                  stroke-width="2"
                  points="
                    0,200 50,180 100,150 150,160 200,140
                    250,130 300,120 350,100 400,110 450,105
                    500,95  550,100 600,90"
                />

                <!-- 盘后区域 -->
                <path d="
                  M600,90
                  L650,95  L700,100 L750,98 L800,96
                  L850,94  L900,92  L950,90  L1000,88
                  L1000,250 L600,250 Z"
                  fill="url(#hatch)" stroke="none"/>

                <!-- 盘后折线 -->
                <polyline
                  fill="none"
                  stroke="#999"
                  stroke-width="2"
                  points="
                    600,90 650,95 700,100 750,98 800,96
                    850,94 900,92 950,90 1000,88"
                />

                <!-- 坐标轴 -->
                <line x1="50" y1="20" x2="50" y2="250" stroke="#888" stroke-width="1"/>
                <line x1="0"  y1="250" x2="1000" y2="250" stroke="#888" stroke-width="1"/>

                <!-- Y 轴标签 -->
                <text x="0"   y="40"  fill="#888" font-size="12">198.42</text>
                <text x="0"   y="130" fill="#888" font-size="12">195.50</text>
                <text x="0"   y="220" fill="#888" font-size="12">194.65</text>

                <!-- X 轴标签 -->
                <text x="50"  y="270" fill="#888" font-size="12">10:00</text>
                <text x="300" y="270" fill="#888" font-size="12">14:00</text>
                <text x="550" y="270" fill="#888" font-size="12">18:00</text>
              </svg>
            </div>

            <!-- 底部指标 -->
            <div class="stats">
              <div class="stat">
                <div class="label">最高价</div><div class="value">198.39</div>
                <div class="label">最低价</div><div class="value">195.21</div>
                <div class="label">开盘价</div><div class="value">197.20</div>
              </div>
              <div class="stat">
                <div class="label">市值</div><div class="value">2.92万亿</div>
                <div class="label">成交量</div><div class="value">3885.62万</div>
                <div class="label">平均成交量</div><div class="value">5263.46万</div>
              </div>
              <div class="stat">
                <div class="label">市盈率 (TTM)</div><div class="value">27.63</div>
                <div class="label">近 52 周最高</div><div class="value">260.10</div>
                <div class="label">近 52 周最低</div><div class="value">169.21</div>
              </div>
            </div>

          </div>

        </body>
        </html>
        """

    static let stockKO = """
        <!DOCTYPE html>
        <html lang="zh-CN">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>股票卡片 — Coca-Cola Co (KO)</title>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; }
            html, body { width: 100%; height: 100%; }
            body {
              display: flex;
              align-items: center;
              justify-content: center;
              font-family: -apple-system, "Helvetica Neue", Arial, sans-serif;
            }

            .stock-card {
              width: 100%;
              border-radius: 32px;
              background: #fff;
              overflow: hidden;
              box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }
            .stock-header {
              padding: 24px;
            }
            .stock-header .title {
              font-size: 20px; font-weight: 700;
            }
            .stock-header .symbol {
              font-weight: 400; color: #666;
              margin-left: 4px;
            }
            .stock-header .subtitle {
              margin-top: 4px;
              font-size: 14px; color: #888;
            }

            .price-line {
              display: flex; align-items: baseline;
              margin-top: 16px;
            }
            .price-line .price {
              font-size: 48px; font-weight: 700;
              line-height: 1;
            }
            .price-line .unit {
              margin-left: 4px;
              font-size: 18px; color: #666;
            }

            .change {
              margin-top: 8px;
              font-size: 16px;
            }
            .change.negative { color: #C0392B; }
            .change .after { margin-left: 16px; font-size: 14px; color: #666; }

            .tabs {
              display: flex;
              padding: 16px 24px 0;
              gap: 16px;
            }
            .tabs li {
              list-style: none;
              padding: 8px 12px;
              border-radius: 16px;
              cursor: pointer;
              font-size: 14px;
              color: #666;
            }
            .tabs li.active {
              background: #eee;
              color: #333;
            }

            .chart-container {
              position: relative;
              padding: 0 24px;
              margin-top: 16px;
            }
            .chart-container svg {
              width: 100%; height: 200px;
              overflow: visible;
            }

            .stats {
              display: grid;
              grid-template-columns: repeat(3, 1fr);
              padding: 24px;
              border-top: 1px solid #f0f0f0;
            }
            .stat {
              display: flex;
              flex-direction: column;
              gap: 12px;
            }
            .stat .label {
              font-size: 14px;
              color: #888;
            }
            .stat .value {
              font-size: 16px;
              font-weight: 600;
              color: #333;
            }

            /* 线条与渐变 */
            .chart-container svg defs linearGradient stop:first-child { stop-color: rgba(231,76,60,0.4); }
          </style>
        </head>
        <body>

          <div class="stock-card">

            <!-- 头部信息 -->
            <div class="stock-header">
              <div class="title">
                Coca-Cola Co<span class="symbol">(KO)</span>
              </div>
              <div class="subtitle">
                6月17日 GMT-4 下午07:59 · 股市收盘
              </div>

              <div class="price-line">
                <div class="price">69.62</div>
                <div class="unit">USD</div>
              </div>
              <div class="change negative">
                -0.90 (-1.28%) 今天
              </div>

              <ul class="tabs">
                <li class="active">1日</li>
                <li>5日</li>
                <li>1个月</li>
                <li>1年</li>
                <li>5年</li>
                <li>最大值</li>
              </ul>
            </div>

            <!-- 曲线图 -->
            <div class="chart-container">
              <svg viewBox="0 0 600 250" preserveAspectRatio="none">
                <defs>
                  <!-- 日间成交渐变 -->
                  <linearGradient id="grad-day" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="0%" stop-color="rgba(231,76,60,0.4)"/>
                    <stop offset="100%" stop-color="rgba(231,76,60,0)"/>
                  </linearGradient>
                </defs>

                <!-- 成交面积 & 折线 -->
                <path d="M0,200 L50,150 L100,165 L150,170 L200,160 L250,155 L300,150 L350,140 L400,135 L450,130 L500,135 L550,120 L600,110 L600,250 L0,250 Z"
                      fill="url(#grad-day)" stroke="none"/>
                <polyline fill="none" stroke="#E74C3C" stroke-width="2"
                          points="0,200 50,150 100,165 150,170 200,160 250,155 300,150 350,140 400,135 450,130 500,135 550,120 600,110"/>

                <!-- 坐标轴 -->
                <line x1="50" y1="20" x2="50" y2="250" stroke="#888" stroke-width="1"/>
                <line x1="0"  y1="250" x2="600" y2="250" stroke="#888" stroke-width="1"/>
                <!-- 水平虚线 -->
                <line x1="0" y1="40" x2="600" y2="40" stroke="#888" stroke-width="1" stroke-dasharray="4 4"/>
                <!-- 标签 -->
                <text x="0"   y="40"  fill="#888" font-size="12">70.50</text>
                <text x="0"   y="95"  fill="#888" font-size="12">70.25</text>
                <text x="0"   y="150" fill="#888" font-size="12">70.00</text>
                <text x="0"   y="205" fill="#888" font-size="12">69.75</text>
                <text x="0"   y="260" fill="#888" font-size="12">69.50</text>
                <text x="520" y="40"  fill="#888" font-size="12">70.52</text>
                <text x="100" y="280" fill="#888" font-size="12">10:00</text>
                <text x="300" y="280" fill="#888" font-size="12">12:00</text>
                <text x="500" y="280" fill="#888" font-size="12">14:00</text>
              </svg>
            </div>

            <!-- 底部指标 -->
            <div class="stats">
              <div class="stat">
                <div class="label">最高价</div><div class="value">70.46</div>
                <div class="label">最低价</div><div class="value">69.58</div>
                <div class="label">开盘价</div><div class="value">70.38</div>
              </div>
              <div class="stat">
                <div class="label">市值</div><div class="value">2996.63亿</div>
                <div class="label">成交量</div><div class="value">1774.00万</div>
                <div class="label">平均成交量</div><div class="value">1436.62万</div>
              </div>
              <div class="stat">
                <div class="label">市盈率 (TTM)</div><div class="value">27.88</div>
                <div class="label">近 52 周最高</div><div class="value">74.38</div>
                <div class="label">近 52 周最低</div><div class="value">60.62</div>
              </div>
            </div>

          </div>

        </body>
        </html>
        """

    static let stockNVDA = """
        <!DOCTYPE html>
        <html lang="zh-CN">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>股票卡片 — NVIDIA Corp (NVDA)</title>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; }
            html, body { width:100%; height:100%; }
            body {
              display: flex;
              align-items: center;
              justify-content: center;
              font-family: -apple-system, "Helvetica Neue", Arial, sans-serif;
            }
            .stock-card {
              width: 100%;
              border-radius: 32px;
              background: #fff;
              overflow: hidden;
              box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }
            .stock-header {
              padding: 24px;
            }
            .stock-header .title {
              font-size: 20px; font-weight: 700;
            }
            .stock-header .symbol {
              font-weight: 400; color: #666;
              margin-left: 4px;
            }
            .stock-header .subtitle {
              margin-top: 4px;
              font-size: 14px; color: #888;
            }
            .price-line {
              display: flex; align-items: baseline;
              margin-top: 16px;
            }
            .price-line .price {
              font-size: 48px; font-weight: 700; line-height: 1;
            }
            .price-line .unit {
              margin-left: 4px; font-size: 18px; color: #666;
            }
            .change {
              margin-top: 8px; font-size: 16px;
            }
            .change.negative { color: #C0392B; }
            .tabs { display: flex; padding: 16px 24px 0; gap: 16px; }
            .tabs li { list-style: none; padding: 8px 12px; border-radius: 16px; cursor: pointer; font-size: 14px; color: #666; }
            .tabs li.active { background: #eee; color: #333; }
            .chart-container { position: relative; padding: 0 24px; margin-top: 16px; }
            .chart-container svg { width: 100%; height: 200px; overflow: visible; }
            .stats { display: grid; grid-template-columns: repeat(3,1fr); padding: 24px; border-top: 1px solid #f0f0f0; }
            .stat { display: flex; flex-direction: column; gap: 12px; }
            .stat .label { font-size: 14px; color: #888; }
            .stat .value { font-size: 16px; font-weight: 600; color: #333; }
          </style>
        </head>
        <body>
          <div class="stock-card">
            <div class="stock-header">
              <div class="title">NVIDIA Corp<span class="symbol">(NVDA)</span></div>
              <div class="subtitle">6月17日 GMT-4 下午07:59 · 股市收盘</div>
              <div class="price-line">
                <div class="price">144.12</div>
                <div class="unit">USD</div>
              </div>
              <div class="change negative">-0.57 (-0.39%) 今天</div>
              <ul class="tabs">
                <li class="active">1日</li><li>5日</li><li>1个月</li><li>1年</li><li>5年</li><li>最大值</li>
              </ul>
            </div>
            <div class="chart-container">
              <svg viewBox="0 0 600 250" preserveAspectRatio="none">
                <defs>
                  <linearGradient id="grad-day" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="0%" stop-color="rgba(231,76,60,0.4)"/>
                    <stop offset="100%" stop-color="rgba(231,76,60,0)"/>
                  </linearGradient>
                </defs>
                <path d="M0,210 L50,180 L100,185 L150,200 L200,190 L250,200 L300,220 L350,230 L400,220 L450,215 L500,225 L550,230 L600,210 L600,250 L0,250 Z" fill="url(#grad-day)" stroke="none"/>
                <polyline fill="none" stroke="#E74C3C" stroke-width="2" points="0,210 50,180 100,185 150,200 200,190 250,200 300,220 350,230 400,220 450,215 500,225 550,230 600,210"/>
                <line x1="0" y1="40" x2="600" y2="40" stroke="#888" stroke-width="1" stroke-dasharray="4 4"/>
                <line x1="50" y1="20" x2="50" y2="250" stroke="#888" stroke-width="1"/>
                <line x1="0" y1="250" x2="600" y2="250" stroke="#888" stroke-width="1"/>
                <text x="0" y="40" fill="#888" font-size="12">144.90</text>
                <text x="0" y="85" fill="#888" font-size="12">144.60</text>
                <text x="0" y="130" fill="#888" font-size="12">144.30</text>
                <text x="0" y="175" fill="#888" font-size="12">144.00</text>
                <text x="0" y="220" fill="#888" font-size="12">143.70</text>
                <text x="520" y="40" fill="#888" font-size="12">144.69</text>
                <text x="100" y="280" fill="#888" font-size="12">10:00</text>
                <text x="300" y="280" fill="#888" font-size="12">12:00</text>
                <text x="500" y="280" fill="#888" font-size="12">14:00</text>
              </svg>
            </div>
            <div class="stats">
              <div class="stat">
                <div class="label">最高价</div><div class="value">145.22</div>
                <div class="label">最低价</div><div class="value">143.78</div>
                <div class="label">开盘价</div><div class="value">144.49</div>
              </div>
              <div class="stat">
                <div class="label">市值</div><div class="value">3.52万亿</div>
                <div class="label">成交量</div><div class="value">23.36万</div>
                <div class="label">平均成交量</div><div class="value">2.21亿</div>
              </div>
              <div class="stat">
                <div class="label">市盈率 (TTM)</div><div class="value">46.42</div>
                <div class="label">近 52 周最高</div><div class="value">153.13</div>
                <div class="label">近 52 周最低</div><div class="value">86.62</div>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    
    static let stockDelta = """
        <!DOCTYPE html>
        <html lang="zh-CN">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>股票卡片 — Delta Air Lines Inc (DAL)</title>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; }
            html, body { width:100%; height:100%; }
            body {
              display: flex; align-items: center; justify-content: center;
              font-family: -apple-system, "Helvetica Neue", Arial, sans-serif;
            }
            .stock-card {
              width: 100%;
              border-radius: 32px;
              background: #fff;
              overflow: hidden;
              box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }
            .stock-header { padding: 24px; }
            .stock-header .title { font-size: 20px; font-weight: 700; }
            .stock-header .symbol { font-weight: 400; color: #666; margin-left: 4px; }
            .stock-header .subtitle { margin-top: 4px; font-size: 14px; color: #888; }

            .price-line { display: flex; align-items: baseline; margin-top: 16px; }
            .price-line .price { font-size: 48px; font-weight: 700; line-height: 1; }
            .price-line .unit { margin-left: 4px; font-size: 18px; color: #666; }

            .change { margin-top: 8px; font-size: 16px; }
            .change.negative { color: #C0392B; }

            .tabs { display: flex; padding: 16px 24px 0; gap: 16px; }
            .tabs li { list-style: none; padding: 8px 12px; border-radius: 16px;
              cursor: pointer; font-size: 14px; color: #666; }
            .tabs li.active { background: #eee; color: #333; }

            .chart-container { position: relative; padding: 0 24px; margin-top: 16px; }
            .chart-container svg { width: 100%; height: 200px; overflow: visible; }

            .stats { display: grid; grid-template-columns: repeat(3,1fr);
              padding: 24px; border-top: 1px solid #f0f0f0; }
            .stat { display: flex; flex-direction: column; gap: 12px; }
            .stat .label { font-size: 14px; color: #888; }
            .stat .value { font-size: 16px; font-weight: 600; color: #333; }
          </style>
        </head>
        <body>
          <div class="stock-card">
            <div class="stock-header">
              <div class="title">Delta Air Lines Inc<span class="symbol">(DAL)</span></div>
              <div class="subtitle">6月17日 GMT-4 下午07:59 · 股市收盘</div>

              <div class="price-line">
                <div class="price">47.32</div>
                <div class="unit">USD</div>
              </div>
              <div class="change negative">-2.14 (-4.33%) 今天</div>

              <ul class="tabs">
                <li class="active">1日</li>
                <li>5日</li>
                <li>1个月</li>
                <li>1年</li>
                <li>5年</li>
                <li>最大值</li>
              </ul>
            </div>

            <div class="chart-container">
              <svg viewBox="0 0 600 250" preserveAspectRatio="none">
                <defs>
                  <linearGradient id="grad-day" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="0%" stop-color="rgba(231,76,60,0.4)"/>
                    <stop offset="100%" stop-color="rgba(231,76,60,0)"/>
                  </linearGradient>
                </defs>
                <!-- 成交面积 -->
                <path d="M0,220 L50,170 L100,175 L150,180 L200,170 L250,165 L300,160 L350,155 L400,150 L450,148 L500,145 L550,147 L600,140 L600,250 L0,250 Z"
                      fill="url(#grad-day)" stroke="none"/>
                <!-- 折线 -->
                <polyline fill="none" stroke="#E74C3C" stroke-width="2"
                          points="0,220 50,170 100,175 150,180 200,170 250,165 300,160 350,155 400,150 450,148 500,145 550,147 600,140"/>
                <!-- 坐标轴 -->
                <line x1="50" y1="20" x2="50" y2="250" stroke="#888" stroke-width="1"/>
                <line x1="0"  y1="250" x2="600" y2="250" stroke="#888" stroke-width="1"/>
                <line x1="0" y1="40" x2="600" y2="40" stroke="#888" stroke-width="1" stroke-dasharray="4 4"/>
                <!-- Y 轴标签 -->
                <text x="0"   y="40"  fill="#888" font-size="12">49.20</text>
                <text x="0"   y="85"  fill="#888" font-size="12">48.60</text>
                <text x="0"   y="130" fill="#888" font-size="12">48.00</text>
                <text x="0"   y="175" fill="#888" font-size="12">47.40</text>
                <text x="0"   y="220" fill="#888" font-size="12">46.80</text>
                <!-- 右侧参考价 -->
                <text x="520" y="40" fill="#888" font-size="12">49.46</text>
                <!-- X 轴标签 -->
                <text x="100" y="280" fill="#888" font-size="12">10:00</text>
                <text x="300" y="280" fill="#888" font-size="12">12:00</text>
                <text x="500" y="280" fill="#888" font-size="12">14:00</text>
              </svg>
            </div>

            <div class="stats">
              <div class="stat">
                <div class="label">最高价</div><div class="value">48.94</div>
                <div class="label">最低价</div><div class="value">47.05</div>
                <div class="label">开盘价</div><div class="value">48.50</div>
              </div>
              <div class="stat">
                <div class="label">市值</div><div class="value">308.98亿</div>
                <div class="label">成交量</div><div class="value">3011.00万</div>
                <div class="label">平均成交量</div><div class="value">948.59万</div>
              </div>
              <div class="stat">
                <div class="label">市盈率 (TTM)</div><div class="value">8.39</div>
                <div class="label">近 52 周最高</div><div class="value">69.98</div>
                <div class="label">近 52 周最低</div><div class="value">34.74</div>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
}
