$.extend({
    // 입력 항목의 byte를 구한다.
    getBytes: function(value) {
        function characterLength(characters, position) {
            var character = characters.charAt(position);
            if(escape(character).length > 4) {  // 한글일경우 2byte
                return 2;
            } else if (character == '\n') {     // 줄바꿈일경우
                if(characters.charAt(position-1) != '\r') {     // 하지만 밀려서 줄이 바뀐경우가 아닐때
                    return 1;
                }
            } else if (character == '<' || character == '>') {  // 특수문자는 4byte
                return 4;
            } else {
                return 1;
            }
        }
        var bytes = 0;
        var characters_length = value.length;
        for (var position=0; position < characters_length; position++) {
            bytes += characterLength(value, position);
        }
        return bytes;
    },
    dateISO: function(value) {
        if (/^\d{4}[\/-]\d{1,2}$/.test(value)) {
            var dateArr = value.split('-');
            var yyyy = parseInt(dateArr[0], 10), MM = parseInt(dateArr[1] - 1, 10), dd = 1;
            var dateObj = new Date(yyyy, MM, dd);
            return (dateObj.getFullYear() == yyyy && dateObj.getMonth() == MM);
        } else {
            return false;
        }
    },
    juminCheck : function(reg_id1, reg_id2) {
    	/*
    	check = false;
		total = 0;
		temp = new Array(13);
		//temp[13] 13번째 자리수
		for (i = 1; i <= 6; i++)
			temp[i] = reg_id1.charAt(i - 1);
		for (i = 7; i <= 13; i++)
			temp[i] = reg_id2.charAt(i - 7);

		for (i = 1; i <= 12; i++) {
			k = i + 1;
			if (k >= 10)
				k = k % 10 + 2;
			total = total + temp[i] * k;
		}
		mm = temp[3] + temp[4];
		dd = temp[5] + temp[6];

		totalmod = total % 11;

		chd = 11 - totalmod;
		if (chd == 11) {
			chd = 1;
		} else if (chd == 10) {
			chd = 0;
		}
		if (chd == temp[13] && mm < 13 && dd < 32 && (temp[7] > 0 && temp[7] < 5)) {
			check = true;
		}
		return check;
		*/

		// 외국인등록번호 유효성 로직까지 추가
    	/*
    	check = false;
		total = 0;
		temp = new Array(2,3,4,5,6,7,8,9,2,3,4,5);
		var strJumin =  reg_id1+reg_id2;

		var num7  = strJumin.charAt(6);

		var num13 = strJumin.charAt(12);

		if (strJumin.length == 13 ) {

			for (i=0; i<temp.length; i++) { // 주민번호 12자리를 키값을 곱하여 합산한다.
				total += strJumin.charAt(i)*temp[i];
			}
			// 외국인 구분 체크
			if (num7 == 0 || num7 == 9) { // 내국인 ( 1800년대 9: 남자, 0:여자)
				total = (11-(total%11)) % 10;
			}
			else if (num7 > 4) {  // 외국인 ( 1900년대 5:남자 6:여자  2000년대 7:남자, 8:여자)
				total = (13-(total%11)) % 10;
			}
			else { // 내국인 ( 1900년대 1:남자 2:여자  2000년대 3:남자, 4:여자)
				total = (11-(total%11)) % 10;
			}
			if(total != num13) {
				check = false;
			}

			check = true;

		} else{
			check = false;
		}

    	return check;
    	*/


    	check = false;
    	var sum = 0;
    	var rrn = reg_id1 + reg_id2;
    	var regChk = reg_id2.substring(0,1);

    	//내국인일 경우 유효성 체크 1,2,3,4
    	if(regChk == 1 || regChk == 2 || regChk == 3 || regChk == 4){


    		//13 자리가 아니면
    		if (rrn.length != 13) {

    			check = false;

            }

    		for (var i = 0; i < 12; i++) {

                sum += Number(rrn.substr(i, 1)) * ((i % 8) + 2);

            }

            if (((11 - (sum % 11)) % 10) == Number(rrn.substr(12, 1))) {

            	check = true;

            }


    	}else{	// 외국인등록번호 유효성 체크 5,6,7,8

    		if (rrn.length != 13) {

    			check = false;

            }


    		if (Number(rrn.substr(7, 2)) % 2 != 0) {

    			check = false;

            }


            for (var i = 0; i < 12; i++) {

                sum += Number(rrn.substr(i, 1)) * ((i % 8) + 2);

            }


            if ((((11 - (sum % 11)) % 10 + 2) % 10) == Number(rrn.substr(12, 1))) {

            	check = true;

            }

    	}

    	return check;

    },
    //반올림한다.
    round : function(val, precision) {
    	 val = val * Math.pow(10,precision);
    	 val = Math.round(val);
    	 return val/Math.pow(10,precision);
    },
    //숫자체크
    isNumber : function(str) {
    	var findStr = str.match(/[0123456789.]+/);
    	if ( str == findStr )
    		return true;
    	else
    		return false;
    },
    //email체크
    emailCheck : function(email) {
    	// 이메일 주소를 판별하기 위한 정규식
        var format = /^[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+)*@[0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*$/;

        // 인자 email_address를 정규식 format 으로 검색
        if (email.search(format) != -1){
            // 정규식과 일치하는 문자가 있으면 true
            return true;
        } else {
            // 없으면 false
            return false;
        }
    },
    //쿠키저장
    setCookie : function(c_name,value,expiredays) {
    	var exdate = new Date();
    	exdate.setDate(exdate.getDate()+expiredays);
    	document.cookie = c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
    },
    //쿠기조회
    getCookie : function(c_name) {
    	if (document.cookie.length>0) {
    		c_start = document.cookie.indexOf(c_name + "=");
    		if (c_start != -1) {
    			c_start = c_start + c_name.length+1;
    			c_end = document.cookie.indexOf(";",c_start);
    			if (c_end==-1) c_end = document.cookie.length;
    			return unescape(document.cookie.substring(c_start,c_end));
    		}
    	}
    	return "";
    }
});
// 문자열 공백제거
// 오른쪽 공백제거
function rightTrim(str) {
	str = str + "";
	var len = str.length;

	for(var i = (len - 1); (str.charAt(i) == ' ');i--);
	str = str.substring(0, i + 1);

	return str;
}
// 왼쪽 공백제거
function leftTrim(str) {
	var len = str.length;
	var i = 0;

	for(i = 0; str.charAt(i) == ' '; i++);
	str = str.substring(i, len);

	return str;
}
// 양쪽 공백제거
function trimStr(str) {
	return leftTrim(rightTrim(str));
}
// 문자열 공백제거

// 조사 검사
String.prototype.hasFinalConsonant = function(str) {
    str = this != window ? this : str;
    var strTemp = str.substr(str.length-1);
    return ((strTemp.charCodeAt(0)-16)%28!=0);
}

function josa(str,tail) {
    return (str.hasFinalConsonant()) ? str+tail.substring(0,1) : str+tail.substring(1,2);
}
// 조사 검사

// text, textarea 입력값 체크
function isTextValidate(obj,kind,len,name)
{
	var str  = "";
	str = trimStr(obj.value);
	if ((str == "" || str == " ") && kind != "check")
	{
		alert(josa(name,"을를") + " 입력하세요.");
		obj.focus();
		return false;
	}

	if (kind == "number")
	{
        if (isNaN(str) || /^\s+$/.test(str))
        {
			alert(josa(name,"은는") + " 숫자만 입력하세요.");
			obj.focus();
			return false;
        }
	}
	else if (kind == "alpha")
	{
		if (!/^[a-z A-Z]+$/.test(str))
		{
			alert(josa(name,"은는") + " 알파벳만 입력하세요.");
			obj.focus();
			return false;
        }
	}
	else if (kind == "alphanum")
	{
		if (/\W/.test(str))
		{
			alert(josa(name,"은는") + " 알파벳과 숫자만 입력하세요.");
			obj.focus();
			return false;
        }
	}
	else if (kind == "engnum")
	{
		if (/[^a-z0-9]/.test(str))
		{
			alert(josa(name,"은는") + " 영문소문자와 숫자만 입력하세요.");
			obj.focus();
			return false;
        }
	}
	else if (kind == "check")
	{
		var leng = obj.length;
		var flag = false;

		if (leng != undefined)
		{
			for(var i=0; i<leng; i++)
			{
				if (obj[i].checked == true)
				{
					flag = true;
				}
			}
		}
		else
		{
			if (obj.checked == true)
				flag = true;
		}

		if (!flag)
		{
			alert(josa(name,"을를") + " 선택하세요.");
			return false;
		}
	}
	else if (kind == "image")
	{
		var tmp = str.split(".");
		var ext = tmp[tmp.length-1];
		ext = ext.toLowerCase();
		if (ext != "gif" && ext != "jpg" && ext != "png")
		{
			alert(josa(name,"은는") + " 이미지 파일만 가능합니다.");
			return false;
		}
	}

	if (len > 0 && str.length < len)
	{
		alert(josa(name,"은는") + " "+len+"자 이상 입력하세요.");
		obj.focus();
		return false;
	}

	return true;
}

// 숫자만 입력 확인.
function onlyNumber(){
	// - 음수 표시를 위해 45 허용
    if((event.keyCode!=45 && event.keyCode<48)||(event.keyCode>57))
    event.returnValue=false;
}

// 입력된 값의 확인하여 maxlen 까지만 남긴다.
function lengthCheck(obj, maxlen)
{
    var string = obj.value;
    if ( getStringLength(string) > maxlen )
    {
        alert("입력된 값이 허용된 길이를 초과합니다.");
        obj.value = obj.value.substring(0, getStrngCount(obj.value, maxlen));
    }
}

// 문자열 길이 체크 알파뉴메릭(1자리), 한글(2자리)
function getStringLength (str)
{
    var retCode = 0;
    var strLength = 0;

    for (i=0; i<str.length; i++)
    {
        var code = str.charCodeAt(i);
        var ch = str.substr(i,1).toUpperCase();

        code = parseInt(code);

        if ( (ch < "0" || ch > "9") && ( ch < "A" || ch > "Z") && ( (code > 255) || (code < 0) ) )
            strLength = strLength + 2;
        else
            strLength = strLength + 1;
    }
    return strLength;
}

// 문자열 길이에 따른 문자 갯수
function getStrngCount(str, maxlen)
{
    var retCode = 0;
    var strLength = 0;
    var count = 0;

    for (i=0; i<str.length; i++)
    {
        var code = str.charCodeAt(i);
        var ch = str.substr(i,1).toUpperCase();

        code = parseInt(code);

        if ( (ch < "0" || ch > "9") && ( ch < "A" || ch > "Z") && ( (code > 255) || (code < 0) ) )
            strLength = strLength + 2;
        else
            strLength = strLength + 1;

        if ( strLength > maxlen ) break;

        count++;
    }
    return count;
}

// 주민등록번호 검사
function checkPersonalNo(personal_no)
{
    personal_no = personal_no.replace(/[^\d]+/g, '');
    pattern = /^[0-9]{6}[1-8][0-9]{6}$/;

    if(!pattern.test(personal_no)) {
        return false;
    }
    var birth = new Array();
    birth[0] = personal_no.substr(0, 2);
    switch(personal_no.charAt(6)) {
    case '1':
    case '2':
        birth[0] = ('19' + birth[0]) * 1;
        birth[3] = false;
        break;
    case '3':
    case '4':
        birth[0] = ('20' + birth[0]) * 1;
        birth[3] = false;
        break;
    case '5':
    case '6':
        birth[0] = ('19' + birth[0]) * 1;
        birth[3] = true;
        break;
    case '7':
    case '8':
        birth[0] = ('20' + birth[0]) * 1;
        birth[3] = true;
        break;
    /*case '9': // 이렇게 늙은 사람은 있어도 안받아요. 위의 정규식에서 안받음.
    case '0':
        birth[0] = ('18' + birth[0]) * 1;
        birth[3] = true;
        break;*/
    }

    birth[1] = personal_no.substr(2, 2) * 1;
    birth[2] = personal_no.substr(4, 2) * 1;

    if(birth[1] < 1 || birth[1] > 12) {
        return false;
    }
    if(birth[2] < 1 || birth[2] > 31) {
        return false;
    }
    var check = 0;
    var mul = 2;

    if(birth[3]) {
        if(((personal_no.charAt(7) * 10 + personal_no.charAt(8)) % 2) != 0) {
            return false;
        }
    }
    for(i = 0; i < 12; i ++) {
        check += personal_no.charAt(i) * mul;
        mul ++;
        if(mul > 9) {
            mul = 2;
        }
    }

    check = 11 - (check % 11);

    if(check > 9) {
        check %= 10;
    }
    if(birth[3]) {
        check += 2;
        if(check > 9) {
            check %= 10;
        }
    }
    if(check != personal_no.charAt(12)) {
        return false;
    }
    return birth;
}

//패스워드체크 (영문+숫자+특수문자)
function passwordChk(password)
{
	var pattern1 = new RegExp(/^([0-9]|[a-z]|[~!@#\$%\^&\*\(\)\-_\+\=\{\}\\\|;\:,\.\?\/\"']){9,15}$/gi);
	var pattern2 = new RegExp(/[0-9]+/gi);
	var pattern3 = new RegExp(/[a-z]+/gi);
	var pattern4 = new RegExp(/[~!@#\$%\^&\*\(\)\-_\+\=\{\}\\\|;\:,\.\?\/\"']+/gi);

	if(!pattern1.test(password)) return false;
	else if(!pattern2.test(password)) return false;
	else if(!pattern3.test(password)) return false;
	else if(!pattern4.test(password)) return false;
	else return true;
}

//나이계산
function setAge(birth)
{
	var bdd = parseInt(birth.substring(6,8));
	var bmm = parseInt(birth.substring(4,6))-1;
	var byy = parseInt(birth.substring(0,4));

	var now = new Date();
	var dd = now.getDate();
	var mm = now.getMonth();
	var yy = now.getFullYear();

	var age;
	if (mm > bmm || (bmm == mm && dd >= bdd))
		age = byy;
	else
		age = byy + 1;

	return yy - age;
}