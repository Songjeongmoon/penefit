/**
 * 
 */

   $("#blackloupe_img2").click(()=> {
         if ($("#divsearch").css("display") == "none") { 
               $("#divsearch").show();//display :none 일떄
           } else {
               $("#divsearch").hide(); //display :block 일떄
           } 
    });
      $(".title").click(function(){
       //  alert("click");
         if ($(".subtitle").css("display") == "none"){
            $(".subtitle").show();
         }else{
            $(".subtitle").hide();
         }
      });
      $(document).on( "click",".class_one",function(evt){
         let url = evt.target.children[0].href;
         let detailurl = url.split("/");
         location.href=detailurl[4];
      });
