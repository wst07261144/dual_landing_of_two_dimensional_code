$(document).ready(function(){
    code_is_used();
})

function code_is_used(){
    var code = document.getElementById('code').value;
    console.log('--------code-->' + code);
    $.ajax({
        url:'/code/used/'+code,
        method:'get',
        success: success_call_back,
        error:error_call_back
    })
    function success_call_back(result) {
        if(result!='error'){
            window.location.href = 'http://192.168.1.6:3000/users/show/'+result
        }
        else{
            setTimeout('code_is_used()',2000)
        }
    }
    function error_call_back(error) {
        alert('error')
    }
}

//function request_data(code){
//    console.log("fsdfwafw")
//    $.ajax({
//        url:'/request/data/'+code ,
//        method:'get' ,
//        success: success_call_back,
//        error: error_call_back
//    })
//    function success_call_back(result) {
//        console.log(JSON.stringify(result))
//    }
//    function error_call_back(error) {
//        alert('error')
//    }
//}


