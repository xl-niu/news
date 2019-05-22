<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="plugins/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="plugins/bootstrap-1.13/bootstrap-table.css">

    <script type="text/javascript" src="js/jquery-3.1.1.js"></script>
    <%--bootstrap框架--%>
    <script type="text/javascript" src="plugins/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="plugins/bootstrap-1.13/bootstrap-table.js"></script>
    <script type="text/javascript" src="plugins/bootstrap-1.13/bootstrap-table-zh-CN.min.js"></script>
</head>
<body>
<div id="toolbar" class="btn-group">
    <button id="btn_edit" type="button" class="btn  btn-default">
        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>编辑
    </button>
    <button id="remove" class="btn btn-default">
        <span class="glyphicon glyphicon-remove"></span> 删除
    </button>
</div>
<table id="tb_content"></table>
<script>
    $(function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();

    });
    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tb_content').bootstrapTable({
                url: '/30005',         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 2,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: false,                  //是否显示所有的列
                showRefresh: false,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 560,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [{
                    checkbox: true
                }, {
                    field: 'QGY',
                    align: 'cneter',
                    title: '商品ID'
                }, {
                    field: 'CGZQ',
                    title: '商品标题'
                }, {
                    field: 'HTGDDHQ',
                    title: '叶子类目'
                }, {
                    field: 'PMN20',
                    title: '卖点'
                }, {
                    field: 'PMMCOND',
                    title: '价格'
                }, {
                    field: 'PMN50',
                    title: '库存数量'
                }, {
                    field: 'YSHWSH',
                    title: '条形码'
                }, {
                    field: 'ROW_ID',
                    title: '状态'
                },{
                    field: 'YSHWRK',
                    title: '状态'
                },{
                    field: 'CGY',
                    title: '状态'
                },{
                    field: 'PMN041',
                    title: '状态'
                },{
                    field: 'PMN34',
                    title: '状态'
                }, {
                    field: 'PMM01',
                    title: '创建日期',
                    formatter: function (value, row, index) {
                        return UnixToDate(value,false,'')
                    }
                }, {
                    field: 'IMA021',
                    title: '更新日期',
                    formatter: function (value, row, index) {
                        return UnixToDate(value,false,0)
                    }
                }]
            });
        };
        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                rows: params.limit,   //页面大小
                page: params.offset  //页码
                //departmentname: $("#txt_search_departmentname").val(),
                //statu: $("#txt_search_statu").val()
            };
            return temp;
        };
        return oTableInit;
    };

    var ButtonInit = function () {
        var oInit = new Object();
        var postdata = {};
        oInit.Init = function () {
            //初始化页面上面的按钮事件
        };
        return oInit;
    };

    //获取选中行的ID
    function getIdSelections() {
        return $.map($('#tb_content').bootstrapTable('getSelections'), function (row) {
            return row.id
        });
    }

    //编辑
    $("#btn_edit").click(function () {
        var ids = getIdSelections();
        if (ids.length != 1) {
            alert("请选中单行数据")
        } else {
            $.post("", {
                id: ids
            });
        }
    });
    // 删除
    $('#remove').click(function () {
        var ids = getIdSelections();
        $('#tb_content').bootstrapTable('remove', {
            field: 'id',
            values: ids
        });
        $.ajax({
            type: "post",
            url: "/",
            data: {strJson: ids.toString()},
            success: function (data, status) {
                if (status == "success") {
                    alert("删除成功");
                }
            },
            error: function () {
                alert("Error");
            },
            complete: function () {
            }
        });
        $('#tb_content').bootstrapTable('refresh');
    });

    /**
     * 时间戳转换日期
     * @param <int> unixTime    待时间戳(秒)
     * @param <bool> isFull     返回完整时间(Y-m-d 或者 Y-m-d H:i:s)
     * @param <int>  timeZone   时区
     */
    function UnixToDate(unixTime, isFull, timeZone) {
        console.log(unixTime+","+isFull+""+timeZone);
        if (typeof (timeZone) == 'number') {
            unixTime = parseInt(unixTime) + parseInt(timeZone) * 60 * 60;
        }
        var time = new Date(unixTime);
        var date = "";
        date += time.getUTCFullYear() + "-";
        date += (time.getUTCMonth() + 1) + "-";
        date += time.getUTCDate();
        if (isFull === true) {
            date += " " + time.getUTCHours() + ":";
            date += time.getUTCMinutes() + ":";
            date += time.getUTCSeconds();
        }
        return date;
    }
</script>
</body>
</html>
