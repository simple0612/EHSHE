$(document).ready(function() {
    $('#summernote').summernote({

        height:400, // 에디터 높이
        lang : 'ko-KR', // 언어 : 한국어

        // 이미지 업로드 이벤트가 발생했을 때 콜백함수 수행
        callbacks : {
            onImageUpload : function(files, editor){
                // files : 업로드된 이미지가 배열로 저장되어 있음
                // editor == this : 이미지가 업로드된 섬머노트 에디터
                sendFile(files[0], this)
            }
        }

    });
  });

  // 썸머노트에 업로드된 이미지를 비동기로 서버로 전송하여 저장하는 함수 
function sendFile(file, editor){

    var formData = new FormData();
    // FormDate : form 태그 내부 값 전송을 위한 객체로 
    // 추가된 값을 k=v 형태로 쉽게 생성해주는 객체 

    formData.append("uploadFile", file);

    $.ajax({
        url : "insertImage",
        type : "post",
        enctype : "multipart/form-data", // 파일 전송 형식으로 인코딩 지정
        //data : {"uploadFile" : file},
        data : formData,
        contentType : false, // 서버로 전송되는 데이터 형식
        // 기본값 : application/x-www-form-urlencoded; charset=utf-8
        //          == 텍스트
        // false : 바이트 코드 있는 그대로 

        cache : false,
        processData : false,
        // 서버로 전달되는 값을 쿼리스트링으로 전달할 경우 true, 아니면 false
        // 파일 전송 시 false로 지정
        dataType : "json",
        success : function(at){
            console.log(at);

            // 자바스크립트를 이용한 context를 얻어오는 방법
            var contextPath = location.pathname.substring(0, window.location.pathname.indexOf("/",2));

            console.log(contextPath);
            
            // 저장된 이미지를 summernote 에디터에 반영(삽입)
            $(editor).summernote('editor.insertImage',contextPath + at.contentFilePath + "/" + at.fileName);
            //$(editor).summernote('editor.insertImage', "localhost:8080/spring/resources/infoImages/210302102015_58806.png");
                                            // localhost:8080/spring /resources/infoImages        2020~~.jsp
        }
    });
}
