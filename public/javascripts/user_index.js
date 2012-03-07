/**
 * Created by JetBrains RubyMine.
 * User: sal
 * Date: 3/6/12
 * Time: 3:41 PM
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function () {
    $('#role_name_filter_role').on('change', function() {
        var roleName = $("#role_name_filter_role option:selected").val()
        location.replace(location.pathname + '?role_name_filter=' + roleName)
    });
});
