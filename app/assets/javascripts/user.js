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
        result=='ok'? window.location.href = 'http://www.jd.com' : setTimeout('code_is_used()',2000)
    }
    function error_call_back(error) {
        alert('error')
    }
}
