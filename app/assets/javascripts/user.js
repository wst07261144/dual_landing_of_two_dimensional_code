//$(document).ready(function(){
//    code_is_used();
//})
//
//function code_is_used(){
//    var code = document.getElementById('code').value;
//    console.log('--------code-->' + code);
//    $.ajax({
//        url:'/code/used/'+code,
//        method:'get',
//        success: success_call_back,
//        error:error_call_back
//    })
//    function success_call_back(result) {
//        if(result!='error'){
//            window.location.href = 'http://192.168.1.132:3000/users/show/'+result
//            is_logout(code);
//        }
//        else{
//            setTimeout('code_is_used()',2000)
//        }
//    }
//    function error_call_back(error) {
//        alert('error')
//    }
//
//}
//function is_logout(code){
//    console.log('--------code_logout-->' + code);
//    $.ajax({
//        url:'code/logout'+code,
//        method:'get',
//        success:success_call_back,
//        error:error_call_back
//    })
//    function success_call_back(response){
//        console.log(response)
//        if(response == 'logout'){
//           window.location.href = 'http://192.168.1.132:3000' }
//        else {
//           setTimeout('is_logout()',2000)
//        }
//    }
//    function error_call_back(error){
//        console.log(error)
//    }
//}




