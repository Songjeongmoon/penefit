<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
  Kakao.init('7fc4637ef75ce5e0c13bf113d0284ba6'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="카카오 로그인 버튼" />
</a>
<p id="token-result"></p>
<button class="api-btn" onclick="sendToMe()" style="visibility:hidden">나에게 메시지 보내기</button>

<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
      state: 'sendme_feed',
      scope: 'talk_message', // 앱 동의 항목 설정 및 사용자 동의 필요
    });
  }

  function sendToMe() {
    Kakao.API.request({
      url: '/v2/api/talk/memo/default/send',
      data: {
        template_object: {
          object_type: 'feed',
          content: {
            title: '딸기 치즈 케익',
            description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
            image_url:
              'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
            link: {
              // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
              mobile_web_url: 'https://http://localhost:8082',
              web_url: 'https://http://localhost:8082',
            },
          },
          social: {
            like_count: 286,
            comment_count: 45,
            shared_count: 845,
          },
          buttons: [
            {
              title: '웹으로 보기',
              link: {
                mobile_web_url: 'https://http://localhost:8082',
                web_url: 'https://http://localhost:8082',
              },
            },
            {
              title: '앱으로 보기',
              link: {
                mobile_web_url: 'https://developers.kakao.com',
                web_url: 'https://developers.kakao.com',
              },
            },
          ],
        },
      },
    })
      .then(function(res) {
        alert('success: ' + JSON.stringify(res));
      })
      .catch(function(err) {
        alert('error: ' + JSON.stringify(err));
      });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      document.querySelector('#token-result').innerText = 'login success, ready to send a message';
      document.querySelector('button.api-btn').style.visibility = 'visible';
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>
</body>
</html>