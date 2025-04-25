//제이쿼리 선언
$(function(){

    //버튼 클릭
    $("#dataOpen").click(function(){
        alert("게시글 데이터를 가져옵니다.");
        // html 서버 통신X, 웹프로그래밍, ajax방법
        // html 일부데이터만 화면전환없이 변경이 가능
        $.ajax({
            url:"js/board.json",       //서버로 전송하는 페이지
            type:"get",                   //get,post
            data:{"bno":1,"bhit":50},     //서버로 전송하는 데이터    
            dataType:"json",     //html,xml,json,text
            success:function(data){ //서버와 통신성공하면 data변수로 데이터를 전송
                //alert("성공");
                console.log(data);
                console.log("1번째 : ",data[0]);
                console.log("1번째 : ",data[0].bno);
                console.log("총개수 : ",data.length);
                let hdata = ``;
                for(let i=0;i<data.length;i++){
                    hdata += `<tr id="${data[i].bno}">`;
                    hdata += `<td>${data[i].bno}</td>`;
                    hdata += `<td>${data[i].title}</td>`;
                    hdata += `<td>${data[i].id}</td>`;
                    hdata += `<td>${data[i].bdate}</td>`;
                    hdata += `<td>${data[i].bhit}</td>`;
                    hdata += `<td>`;
                    hdata += `<button type="button" class="updateBtn">수정</button>`;
                    hdata += `<button type="button" class="deleteBtn">삭제</button>`;
                    hdata += `</td>`;
                    hdata += `</tr>`;
                }
                $("#tbody").html(hdata);
            },
            error:function(){
                alert("실패");
            }
        });//ajax
    });//dataOpen

    //버튼 클릭2
    $("#dataOpen2").click(function(){
        alert("게시글 데이터를 가져옵니다.");
        // html 서버 통신X, 웹프로그래밍, ajax방법
        // html 일부데이터만 화면전환없이 변경이 가능
        $.ajax({
            url:"js/students.json",       //서버로 전송하는 페이지
            type:"get",                   //get,post
            data:{"bno":1,"bhit":50},     //서버로 전송하는 데이터    
            dataType:"json",     //html,xml,json,text
            success:function(data){ //서버와 통신성공하면 data변수로 데이터를 전송
                //alert("성공");
                console.log(data);
                console.log("총개수 : ",data.length);
                let hdata = ``;
                for(let i=0;i<data.length;i++){
                    hdata += `<tr id="${data[i].sno}">`;
                    hdata += `<td>${data[i].sno}</td>`;
                    hdata += `<td>${data[i].sname}</td>`;
                    hdata += `<td>${data[i].kor}</td>`;
                    hdata += `<td>${data[i].eng}</td>`;
                    hdata += `<td>${data[i].math}</td>`;
                    hdata += `<td>${data[i].kor+data[i].eng+data[i].math}</td>`;
                    hdata += `<td>${((data[i].kor+data[i].eng+data[i].math)/3).toFixed(2)}</td>`;
                    hdata += `<td>${data[i].sdate}</td>`;
                    hdata += `<td>`;
                    hdata += `<button type="button" class="updateBtn">수정</button>`;
                    hdata += `<button type="button" class="deleteBtn">삭제</button>`;
                    hdata += `</td>`;
                    hdata += `</tr>`;
                }
                $("#tbody").html(hdata);
            },
            error:function(){
                alert("실패");
            }
        });//ajax
    });//dataOpen

    

    

});//jquery