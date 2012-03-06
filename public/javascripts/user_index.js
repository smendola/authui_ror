/**
 * Created by JetBrains RubyMine.
 * User: sal
 * Date: 3/6/12
 * Time: 3:41 PM
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function () {
    $('#role_name_filter_role').on('change', function() {
        alert('changed');
        $.param.querystring(location.href, 'role_name_filter=' + $("#role_name_filter_role[selected]").value)
    });
});
