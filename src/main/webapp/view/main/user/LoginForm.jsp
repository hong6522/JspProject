<%@page import="model_p.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="../jquery/jquery_3_6_3.js"></script>
<script type="text/javascript">

$(function() {
    // 아이디 중복확인
    $("#idChk").click(function() {
        if ($('#id').val() == "") {
            alert("아이디를 입력하세요");
            return;
        }
        if ($('#address').val() == "") {
            alert("주소를 다시 입력하세요");
            return;
        }
        var chk = true;
        
        $.ajax({
            url: "/KRProj/ABAB", // 내용을 보내고 가져올 페이지
            type: "POST", //타입은 post
            data: { pid: $("#id").val() },
            success: function(ddd) { // 성공시
                let msg = "사용가능한 아이디입니다";
                chk = false;
                $('#next')
                
                
                if (eval(ddd)) { // 문자열로 알아서 eval을 써줘야함
                    msg = "중복된 아이디입니다";
                    chk = true;
                }
                alert(msg);
                if (!chk) {
                    // 아이디가 중복되지 않은 경우, 아이디 입력란을 읽기 전용으로 설정
                    $("#id").attr("readonly", true);
                    $("#next").prop("disabled", false);

                }
            },
            error: function(ee) { //실패시
                msg = "아이디를 입력하세요";
                console.log(ee);
            }
        });
    });
});


function frmGo(){
		

	  if(!/^[a-z0-9]{3,16}$/.test(frm.id.value) ){
	            alert("id를 다시 입력하세요")
	            return
	        }

	        if(!/^[a-z0-9]{3,16}$/.test(frm.pw.value) ){
	            alert("비밀번호를 다시 입력하세요")
	            return
	        }
	        
	        if((frm.repw.value) != (frm.pw.value) ){
	            alert("비밀번호 불일치")
	            return
	        }
	        
	        if(!/^[가-힣]{2,5}$/.test(frm.pname.value)){
	            alert("이름을 다시 입력하세요")
	            return
	        }

	        if(!/^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/.test(frm.email.value)){
	            alert("이메일을 다시 입력하세요")
	            return
	        }
	       
	        if(!/\d{3}-\d{4}-\d{4}/.test(frm.tel.value)){
	            alert("전화번호를 다시 입력하세요")
	            return
	        }
	        if(!/^[가-힣]{2,6}$/.test(frm.nick.value)){
	            alert("닉네임을 다시 입력하세요")
	            return
	        }
	        if(!/\d{4}-\d{2}-\d{2}/.test(frm.birthStr.value)){
	            alert("생일을 다시 입력하세요")
	            return
	        }

	        alert("확인")
		    frm.submit()
}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
         
                document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>



<h1 class="title">회원가입</h1>
<style>
.wrap {
	width: 1200px;
}

body {
	background: #f7f8f9;
}

.title {
	font-size: 26px;
	margin-bottom: 26px;
	text-align: center;
	margin-top: 30px;
}

.formT {
	border: 1px solid #dfdfdf;
	border-radius: 12px;
	width: 100%;
	max-width: 850px;
	margin: 50px auto;
	padding: 20px 0 7px 0;
	background: #fff;
}

.join {
	padding: 8px 8px;
	width: 250px;
	max-width: 300px;
	border: 1px solid #e0e0e0;
	border-radius: 5px;
	margin-left: 5px;
}

.postNum {
	padding: 8px 8px;
	width: 60px;
	max-width: 300px;
	border: 1px solid #e0e0e0;
	border-radius: 5px;
	margin-left: 5px;
}

.wrap>div {
	padding: 13px;
	margin-left: 243px;
	margin-top: 7px;
	width: 600px;
}

}
.wrap span {
	color: black;
	margin: 0 5px 0 0;
	font-size: 17px;
}

#next {
	margin-left: 135px;
	padding: 1px 5px;
	background-color: #000;
	color: #fff;
	border: 1px solid #000;
	border-radius: 5px;
	font-size: 16px;
	margin-top: -7px;
	border-radius: 5px;
}

.wrap select {
	padding: 8px 8px;
	width: 150px;
	max-width: 300px;
	border: 1px solid #e0e0e0;
	border-radius: 5px;
}

#idChk {
	padding: 1px 5px;
	background-color: #000;
	color: #fff;
	border: 1px solid #000;
	border-radius: 5px;
	font-size: 16px;
	margin-top: -7px;
	border-radius: 5px;
}

.color-red {
	color: red !important;
}

#listBtn{
padding: 5px 10px;
	background-color: #000;
	color: #fff;
	border: 1px solid #000;
	border-radius: 5px;
	font-size: 16px;
	margin-top: -7px;
	border-radius: 5px;
}

</style>
<body>
<form action="JoinReg" name="frm" class="formT" method="post" enctype="multipart/form-data">
	<div class="wrap">
		<div>
			<span>id<span class="color-red">*</span></span>
		<input type="text" name="id" id="id" required class="join" placeholder="아이디를 입력하세요."/>
			<input type="button" value="중복확인" id="idChk" required> 
		</div>
		<div>
			<span>pw<span class="color-red">*</span></span>
			<input type="password" name="pw" required class="join" placeholder="6~8글자이내로 입력하세요."/>
			
		</div>
		<div>
			<span>pw 확인<span class="color-red">*</span></span>
			<input type="password" name="repw" required class="join" placeholder="비밀번호를 한 번 더 입력하세요."/>
		</div>
		<div>
			
		<span>비밀번호 찾기 질문<span class="color-red">*</span></span>
		<select name="qq" >
			<option>좋아하는 찌개는?</option>
			<option>좋아하는 장소는?</option>
			<option>집 가고싶니?</option>
			</select></div>
			<div>
			<span>비밀번호 찾기 답변<span class="color-red">*</span></span>
			<input type="text" name="aa" required class="join" placeholder="질문의 답을 적으세요." />
		</div>
		
		<div>
			<span>이름<span class="color-red">*</span></span>
			<input type="text" name="pname" required  class="join" placeholder="이름을 입력하세요."/>
			
		</div> 
		<div>
			<span>이메일<span class="color-red">*</span></span>
			<input type="text" name="email" required class="join"/>
		</div>
		
		<div>
			<span>주소<span class="color-red">*</span></span>
			<input type="text" id="sample4_postcode" placeholder="우편번호" name="postAddr1" class="postNum">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" id="idChk"><br><br>
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소" size="60" name="postAddr2" class="join">
			<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_detailAddress" placeholder="상세주소"  size="60" name="postAddr3" class="join"><br>
			<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
			<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" >

<!-- 			<input type="text" name="address" required class="join" /> -->
		</div>
		<div>
			<span>휴대폰 번호<span class="color-red">*</span></span>
			<input type="text" name="tel" required class="join" placeholder="-를 포함하여 입력하세요." />
		</div>
		<div>
		<span>	닉네임<span class="color-red">*</span></span>
			<input type="text" name="nick" required class="join" />
		</div>
		<div>
			<span>생일<span class="color-red">*</span></span>
			<input type="date" name="birthStr" required  class="join" placeholder="생년월일을 입력하세요."/>
		</div>
		
		<div>
<input type="button" value="완료" onclick="frmGo()" id="next" disabled/>
			
		</div>
	</div>
</form>
</body>