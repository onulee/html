// jquery선언
$(function(){
    $("#dataOpen3").click(function(){
        //alert("확인");
        $.ajax({
            url:"https://apis.data.go.kr/B551011/PhotoGalleryService1/galleryList1?serviceKey=918RE13GA7OY7ZEmUzApgbOeAcQoZ%2FaHsXWcqPAKQ9YNNPj83KOstRMRIUrCFIAcm9qj2R6b7NFZjp%2FYsYzJLg%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&_type=json",
            type:"get",
            data:{},
            dataType:"json",
            success:function(data){
                alert("성공");
                console.log(data.response.body.items.item);
                console.log(data.response.body.items.item[0].galWebImageUrl);
                
                let imgData = data.response.body.items.item[0].galWebImageUrl;
                let hdata =`<img id="img" src="${imgData}">`; 
                $("#txt").html(hdata);


            },
            error:function(){
                alert("실패");
            }
        });
    });

});//jquery