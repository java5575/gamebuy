<%@page import="gamebuy.gb.domain.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html>
    <head>
        <title>購物說明</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="images/icon.ico"/>
        <link rel="bookmark" href="images/icon.ico"/>
        <script src="js/jquery.js" type="text/javascript"></script>
        <link href="css/indexandfooter.css" rel="stylesheet" type="text/css"/>
        <link href="css/QandA.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">




        </style>
        <script type="text/javascript">
            $(function () {
                $('.article').click(function () {
                    $('.article').not(this).removeClass('current');
                    $('.description').not(this).stop(true, false).slideUp();

                    $(this).toggleClass('current');
                    $(this).children('.description').stop(true, false).slideToggle();
                });
            })
        </script>

    </head>
    <body>
        <div class ="header_outside">
            <div class="header">
                <a href="index.jsp"><img class="logo" src="images/logo2.png" alt=""/></a>
                <div class="memberlist">
                    <%Customer customer = (Customer) session.getAttribute("customer");
                        if (customer == null) {

                    %>

                    <a href="${pageContext.request.contextPath}/login.jsp">登入</a>|
                    <a href="${pageContext.request.contextPath}/register.jsp">註冊</a>
                    <%} else {%>
                    <a href="${pageContext.request.contextPath}/cart.jsp"><img src="images/shoppingcar.png"/></a>
                    <a href="${pageContext.request.contextPath}/user/update.jsp">修改會員資料</a>|
                    <a href="${pageContext.request.contextPath}/user/orders_history.jsp">歷史訂單查詢</a>|
                    <a href="${pageContext.request.contextPath}/logout.do">登出</a>
                    <span><%= customer != null ? customer.getName() + "你好" : ""%></span>

                    <%}%>

                </div>
                <form>
                    <input type="search" name="search" placeholder="請輸入關鍵字"/>
                    <input type="submit" value="">
                </form>
            </div>
        </div>
        <div class="wrapper">
            <div class="article">
                <p class="title">Q01.我要怎麼在「GameBuy」購物？</p>
                <div class="description">
                    <p>Ans.在GameBuy購物很簡單。您只要點選您所要購買的商品，之後再選擇取貨方式，填寫您的聯絡資料這樣就完成訂購了！目前我們提供二種取貨方式，第一種為全省「7-ELEVEn、全家、萊爾富、OK」超商門市取貨，第二種為宅急便配送到府。二種方 式都是採到貨付款，也就是說您在收到商品的同時才需要付錢！</p>
                </div>
            </div>
            <div class="article">
                <p class="title">Q02.我為什麼要在GameBuy購物，有什麼好處？</p>
                <div class="description">
                    Ans.
                    <ol>
                        <li>1.不必苦等遊戲上市，在發售當天或隔天就送到您手中。(在廠商沒有延遲發售的前提下)</li>
                        <li>2.讓您買到許多您在市面上所找不到的獨家商品。</li>
                        <li>3.到貨後七天免費的鑑賞期保證。</li>
                        <li>4.可選擇貨到了您的手中才需付款。</li>
                        <li>5.不定時的贈送相關精品。</li>
                        <li>6.不另外加收運費。</li>
                        <li>7.可選擇在全省任一家「7-ELEVEN、全家、萊爾富、OK」便利超商取貨，或是宅配送貨到家。</li>
                    </ol>

                </div>
            </div>
            <div class="article">
                <p class="title">Q03.在GameBuy購物，安全嗎？</p>
                <div class="description">
                    <p>Ans.GameBuy保證您在站上所填寫的所有資料都受到我們嚴密的保護，其中包含您的身份證字號、手機號碼等資訊。再者，自即日起GameBuy的收費方式一律更改為「貨到付款」的方式，讓您付款付的更安心、更有保障。</p>
                </div>
            </div>
            <div class="article">
                <p class="title">Q04.GameBuy是否接受海外的訂單？</p>
                <div class="description">
                    <p>Ans.GameBuy的訂購服務以台灣地區為主，不論您由何處訂購，只要收貨地址在台灣省本島(不包含澎湖、金門、馬祖)，GameBuy都會接受您的訂單。至於其它地區我們目前尚未提供服務。相當多的海外朋友(香港、新加坡為最)希望能夠買到我們站上的商品，但礙於商品配送不易，我們目前還在研擬相關的配送流程，當有進一步的消息我們會馬上公佈。
                    </p>
                </div>
            </div>
            <div class="article">
                <p class="title">Q05.如果商品到門市超過了六天的取貨時限，我還能去取貨嗎？</p>
                <div class="description">
                    <p>Ans.不行。過了六天，「7-ELEVEn、全家、萊爾富、OK」便會將商品退回至GameBuy。我們將會視同您「下單但不來取貨」的方式來處理。</p>
                </div>
            </div>
            <div class="article">
                <p class="title">Q06.「宅配到府」該注意什麼？</p>
                <div class="description">
                    <p>Ans.並且為了確認您當時方便取貨，配送人員會在商品到達前 5 分鐘先以電話通知您。當您在取得商品的同時，請您將備妥的現金交給配送人員即可(請自備零錢，不能夠刷卡)。
                    </p>
                </div>
            </div>
            <div class="article">
                <p class="title">Q07.如果宅配到家時我剛好人不在或不方便收貨怎麼辦？</p>
                <div class="description">
                    <p>Ans.配送人員會在您指定的時間到達前 5 分鐘先以電話通知您。如果您仍沒辦法趕回來或是仍不方便收貨，您也不必擔心。GameBuy與「宅急便」所協議的配送限期為三天。也就是說如果您第一天沒辦法收到商品，宅配人員會在第二天的同一時段做再次配送，即使您第二天臨時又有事，第三天仍會做最後一次的配送。但是如果超過了三天仍沒辦法將商品交到您手中，本商品將會被退回GameBuy，我們將會視同您「下單但不取貨」的方式來處理。</p>
                </div>
            </div>
            <div class="article">
                <p class="title">Q08.當我完成交易後，如果要辦理退貨，我該怎麼做？</p>
                <div class="description">
                    <p>Ans.根據中華民國消費者保護法的規定，在收到商品後的七天之內，如果您想要退貨，我們會將您所支付的金額全數退還給您。退貨及退費程序如下：</p><br>
                    <ol>
                        <li> 1. 請您於上班時間 (周一至周五，上午九點三十分至下午六點) 來電客服部(02)2516-8890 分機 4，或透過信函通知我們您需要申請商品退貨退費，並告知您所欲退貨退費的商品名稱及訂單編號。</li>

                        <li>2. 我們將會進一步詢問您的收件地址，並和您約定時間主動前往收回您欲退貨的商品。在此需請您將全部之商品(含原包裝、發票、商品本體、配件、贈品 等的全部項目)略為妥適包裝，並於包裝外填寫「GameBuy電子商務部退貨中心 收」交由我們於約定時間前往之取件人員收回即可。</li>

                        <li> 3. 請您在退回的商品包裝內附上【訂單編號、真實姓名、GameBuy帳號、電話、住址、及下列資料】(用 E-mail的方式亦可)：
                    </ol><br>
                    <ul>
                        <li>◆ 若您要退費至郵局帳戶請給我們：</li>
                        <li>．郵局局名</li>
                        <li>．帳號 ( 局號 + 帳號 共14碼 )</li>
                        <li>．戶名</li>
                    </ul>
                    <ul>
                        <li>◆ 若您要退費至銀行帳戶請給我們：<li>
                        <li>．銀行名稱</li>
                        <li>．銀行帳號</li>
                        <li>．分行名稱</li>
                    </ul><br>
                    <p>我們的客服人員在收您所寄回的商品並確認您的身份無誤之後，將你之前支付給我們的款項轉入您的戶頭當中(統一每月的月底轉帳)，您無需填寫任何單據。
                        請注意：為了避免有人冒名退費，您戶頭所有人與訂購者的姓名必須一致，我們才會退費給您！</p>
                </div>
            </div>
            <div class="article">
                <p class="title">Q09.如果商品已經拆封，還可以退換貨嗎？</p>
                <div class="description">
                    <p>Ans.依中華民國消費者保護法規定，消費者享有七天的購買猶豫期。但猶豫期並非試用期，若您不確定是否需要此商品前，請切勿拆封。已拆封商品若於七天內有退換貨需求，還請參考下列處理原則：</p><br>
                    <ul>
                        <li>．商品拆封後發現有瑕疵：請於取得商品七日內來信或來電反映，我們將會盡速為您處理退換貨事宜。(※註)</li>

                        <li>．購買的商品為電腦軟體、遊戲光碟、影音商品，依中華民國消費者保護法第十九條第二項規定，除商品瑕疵外，一經拆封後一律不接受退換貨。</li>

                        <li>．購買的商品為虛擬數位商品，依中華民國消費者保護法第十九條第二項規定，一經付款發放商品後一律不接受退換貨。</li>

                        <li>．其他類型商品若已逾越檢查商品之必要程度，將影響退貨權利的完整行使，消費者需負擔商品回復原狀之費用或價值減損之差額，因此若您在訂購商品前或收到商品後，希望更進一步了解您的相關權益保障，或對該產品有任何疑慮，還請您務必先向我們聯繫詢問。</li>
                    </ul><br>
                    <p>※註：部分商品因在庫數量有限，若無庫存時將僅能以退貨方式辦理，還請見諒。</p>
                </div>
            </div>
            <div class="article">
                <p class="title">Q10.未拆封的商品，可以退換貨嗎？</p>
                <div class="description">
                    <p>Ans.依中華民國消費者保護法規定，消費者享有七天的購買猶豫期。
                        若您取得商品後，保持商品全新未拆封狀態時，您將於取貨日起七天內享有完整退貨權益（無須任何條件即可申請退貨，退貨運費由GameBuy負擔）。但商品換貨則需視商品在庫數量而定，還請見諒。若您有退貨需求還請參考下列新品退貨處理原則：</p><br>
                    <ul>
                        <li>．訂錯商品：受限於購物安全機制，無法為您換貨，僅可辦理退貨。</li>
                        <li>．送錯商品：我們將會為您處理退換貨事宜。(※註)</li>
                        <li>．商品未拆封即有破損或瑕疵：請勿拆封，我們將為您處理退換貨事宜。(※註)</li>
                        <li>．因其他緣故不想購買的未拆封商品：我們可直接為您辦理退貨。</li>
                    </ul><br>
                    <p> ※註：部分商品因在庫數量有限，若無庫存時將僅能以退貨方式辦理，還請見諒。</p>
                </div>
            </div>
            <div class="article">
                <p class="title">Q11.紅利有甚麼用途？</p>
                <div class="description">
                    <p>Ans.紅利是用以扣抵您於GameBuy或是代幣商城購買商品的消費金額，一點紅利可扣抵新台幣一元，最高可全額扣抵消費金額。
                        舉例：購買 100 元商品，使用折抵紅利 30 點，僅需付款 70 元。</p>
                </div>
            </div>
            <div class="article">
                <p class="title">Q12.紅利要怎麼獲得？</p>
                <div class="description">
                    <p>Ans.凡完成勇者狩獵村的「紅利任務」，或至GameBuy購買遊戲點數、數位遊戲，都可以獲得紅利。</p>
                </div>
            </div>
            <div class="article">
                <p class="title">Q13.付款失敗或取消訂單時，會歸還紅利嗎？</p>
                <div class="description">
                    <p>Ans.交易時，所扣抵之紅利須先於該筆訂單中暫時扣抵，若付款失敗或取消訂單時，暫扣之紅利將於訂單失效（或取消）後自動歸還至您的紅利存摺中。紅利歸還時程將依系統所訂定之訂單失效時程及作業流程而有所不同。</p>
                </div>
            </div>
            <div class="article">
                <p class="title">Q14.其他使用注意事項</p>
                <div class="description">
                    <p>Ans.1. 紅利非屬玩家個人資產，玩家不得主張紅利所有權。
                        2. 若玩家個人帳號被停止GameBuy購物權限，即無法再繼續於GameBuy使用紅利扣抵。
                        3. 玩家不得主張紅利折換為任何事項，或轉移、合併於第三人帳號。
                        4. 玩家取消交易時，GameBuy將退還交易金額並收回贈與之紅利，若玩家已使用紅利，不足額之紅利，將自退還之金額中扣除。
                        5. GameBuy使用紅利相關辦法依GameBuy公告為主，GameBuy保留更改相關辦法之權利。</p>
                </div>
            </div>        <div class="article">
                <p class="title">Q15.若我對「GameBuy」有其它問題，該如何詢問？</p>
                <div class="description">
                    <p>Ans.若您有任何問題，可以用下列的方式與我們聯絡，我們將會儘快為您解決。</p>
                    <ul>
                        <li> 1. 將您的問題反應至GameBuy的客服中心。</li>
                        <li>2. 撥打我們的客服專線：(02) 2514-9292 (早上九點三十分至晚上六點)。</li>
                        </ul>
                </div>
            </div>
        </div>
         <div class="footwer_outside">
            <div class="footer">
                <p>Copy right by Caesar wang</p>
                <a class="contactus" href="contactUs.jsp">聯絡我們</a>
                <a class="qanda" href="QandA.jsp">Q&A</a>
            </div>
        </div>
        <a href="#" class="go-top">TOP</a>   

    </body>
</html>