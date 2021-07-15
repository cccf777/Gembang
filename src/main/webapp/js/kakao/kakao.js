  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('애플리케이션 추가 시 발급 받은 javascript 키 입력');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    function sendLinkKakao(){
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: $('meta[property="og:title"]').attr( 'content' ),
        description: $('meta[property="og:description"]').attr( 'content' ),
        imageUrl: $( 'meta[property="og:image"]' ).attr( 'content' ),
        link: {
          mobileWebUrl: window.location.href,
          webUrl: window.location.href
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            webUrl: window.location.href
          }
        }
      ]
    });
    }
  //]]>
