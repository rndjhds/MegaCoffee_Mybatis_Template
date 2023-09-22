<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../common/header.jsp" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>LOGIN</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/statics/style/login.css">
    <!--swiper slide-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
</head>
<body>
<!-- header -->
<main>
    <h1>로그인</h1>
    <div class="rap">
        <div class="title">
            <a href="#" class="active">로그인</a>
            <a href="#">회원가입</a>
        </div>
        <div class="info">
            <form class="info_1 info_tab">
                <fieldset>
                    <legend class="skip">로그인양식</legend>
                    <label for="id">아이디
                        <input type="text" id="id" name="memberId" placeholder="아이디를 입력해주세요" autofocus>
                    </label>
                    <label for="pw">비밀번호
                        <input type="password" id="pw" name="password" placeholder="비밀번호를 적어주세요.">
                    </label>
                    <div class="look">
                        <div class="look_a">
                            <a href="#">아이디 찾기</a>
                            <a href="#">비밀번호 찾기</a>
                        </div>
                    </div>
                    <button type="submit" class="login_nomal">로그인</button>
                    <button type="button" class="login_cacao">카카오 로그인</button>
                    <button type="button" class="login_apple">Apple 로그인</button>
                </fieldset>
            </form>
            <div class="info_2 info_tab">
                <p>
                    회원가입을 하시면, 주문 조회와 개인정보 관리 및 위시리스트 확인 등<br> 다양한 혜택을
                    누리실 수 있습니다
                </p>
                <button type="button" class="new_nomal" onclick="register()">신규가입</button>
                <button type="button" class="new_kakao">카카오 아이디 가입</button>
                <button type="button" class="new_apple">Apple 아이디 가입</button>
            </div>
        </div>
    </div>
</main>
<!-- footer -->
<script>

    $(document).ready(function () {
        $("form").validate({
            rules: {
                memberId: {
                    required: true
                },
                password: {
                    required: true
                }
            },
            messages: {
                memberId: {
                    required: "아이디를 입력해야 합니다."
                },
                password: {
                    required: "비밀번호를 입력해주세요."
                }
            },
            submitHandler: function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/member/login",
                    contentType: "application/json; charset-utf-8",
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify({
                        memberId: $("#id").val(),
                        password: $("#pw").val()
                    }),
                    success: function (data) {
                        if (data == true) {
                            alert("성공적으로 로그인이 되었습니다.");
                            location.href="/index";
                        } else {
                            alert("아이디 또는 비밀번호를 확인해주세요");
                        }
                    },
                    error: function () {
                        alert("로그인 도중 문제가 발생하였습니다.");
                    }
                })
            }
        })
    });


    const title = document.querySelectorAll('.rap> .title > a')
    const info = document.querySelectorAll('.rap> .info > .info_tab')
    for(i of info){i.style.display='none'}
    info[0].style.display='block'

    title.forEach(function(target,index,array){
        target.addEventListener('click',function(e){
            e.preventDefault()
            for(i of title){
                i.classList.remove('active')
            }
            target.classList.add('active')
            for(i of info){
                i.style.display='none'
            }
            info[index].style.display='block'
        })
    })

    function register() {
        window.open("/member/save", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=600,height=600");
    }

</script>
<%@include file="../common/footer.jsp" %>
</body>
</html>