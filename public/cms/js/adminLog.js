/**
 * ajax 获取并加载每页的数据
 * @param toUrl
 * @param postData
 * @constructor
 */
function ToAjaxOpForPageAdminLog(toUrl,postData) {
    $.post(
        toUrl,
        postData,
        function (result) {
            if(result.status == 1){
                var str_html = '';
                $.each(result.data,function (i,e) {
                    str_html +=
                        "<tr class=\"tr-item-"+e.id+"\">\n" +

                        "                <td><input type='checkbox' name='ids' class='ids' value="+e.id+"></td>\n" +
                        "                <td>"+e.id+"</td>\n" +
                        "                <td>"+e.action+"</td>\n" +
                        "                <td>"+e.performer+"</td>\n" +
                        "                <td>"+e.timeline+"</td>\n"+
                        "                <td>\n" +
                        "                    <div class=\"layui-btn-group\">\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"showLog('"+e.id+"')\">\n" +
                        "                            <i class=\"layui-icon\">&#xe679;</i>\n" +
                        "                        </button>\n" +
                        "                        <button class=\"layui-btn layui-btn-sm\"\n" +
                        "                                onclick=\"delLog('"+e.id+"')\">\n" +
                        "                            <i class=\"layui-icon\">&#xe640;</i>\n" +
                        "                        </button>\n" +
                        "                    </div>\n" +
                        "                </td>\n" +
                        "            </tr>";
                });
                $(".tbody-items").html(str_html);
            }else{
                //失败
                layer.msg(result.message);
            }
        },"JSON");
}