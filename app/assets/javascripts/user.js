/**
 * Created with JetBrains RubyMine.
 * User: wst
 * Date: 14-1-9
 * Time: 下午4:45
 * To change this template use File | Settings | File Templates.
 */
document.ready(function(){
    code_is_used();
})

function code_is_used(){
    var code = document.getElementById('code').value;
    console.log('code-->' + code);
    $.ajax({
        url:'/code/used/'+code,
        method:'get',
        success: success_call_back,
        error:error_call_back
    })

    function success_call_back(result) {
        alert('success')
    }

    function error_call_back(error) {
        alert('error')
    }
}
