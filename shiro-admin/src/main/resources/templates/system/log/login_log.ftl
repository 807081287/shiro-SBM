<!DOCTYPE HTML>
<html>
<head>
    <title>登录日志</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta charset="UTF-8">

    <!-- bootstrap datetimepicker -->
    <link rel="stylesheet" href="/static/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
    <script src="/static/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script src="/static/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<#--bootstrap table-->
    <link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap-table.min.css">
    <script src="/static/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="/static/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
    <script src="/static/plugins/common/bootstrap-table-object.js"></script>

<#--弹出层-->
    <script src="/static/plugins/layer/layer.js"></script>
    <script src="/static/plugins/common/ajax-object.js"></script>
    <script src="/static/plugins/common/Feng.js"></script>
<#--本页JS-->
    <script src="/static/modular/system/log/login_log.js"></script>
</head>
<body>
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>登录日志
        <small></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li><a href="#">监控管理</a></li>
        <li class="active">登录日志</li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-12 col-lg-12">
            <!-- Horizontal Form -->
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title"><i class="fa fa-search"></i> 查询条件</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="logName" class="col-md-2 col-lg-1 control-label"
                                   style="padding-right:0px;">名称</label>
                            <div class="col-md-4 col-lg-5 ">
                                <input class="form-control" type="text" id="logName" name="logName"
                                       placeholder="名称">
                            </div>
                            <label for="tips" class="col-md-2 col-lg-1 control-label"
                                   style="padding-right:0px">消息</label>
                            <div class="col-md-4 col-lg-5 ">
                                <input class="form-control" type="text" id="message"
                                       name="message"
                                       placeholder="消息">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="beginTime" class="col-md-2 col-lg-1 control-label"
                                   style="padding-right:0px;">开始时间</label>
                            <div class="col-md-4 col-lg-5 ">
                                <div class="input-group date form_date" data-date=""
                                     data-date-format="yyyy-mm-dd" data-link-field="beginTime"
                                     data-link-format="yyyy-mm-dd">
                                    <input class="form-control" size="16" type="text" value=""
                                           readonly placeholder="开始时间">
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-remove"></span></span>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                                <input type="hidden" id="beginTime" value=""/>
                            </div>
                            <label for="endTime" class="col-md-2 col-lg-1 control-label"
                                   style="padding-right:0px">结束时间</label>
                            <div class="col-md-4 col-lg-5 ">
                                <div class="input-group date form_date" data-date=""
                                     data-date-format="yyyy-mm-dd" data-link-field="endTime"
                                     data-link-format="yyyy-mm-dd">
                                    <input class="form-control" size="16" type="text" value=""
                                           readonly placeholder="结束时间">
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-remove"></span></span>
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                                <input type="hidden" id="endTime" value=""/>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer text-center">
                        <button type="button" onclick="LoginLog.search();" class="btn btn-primary btn-sm no-margin-top">
                            <i class="fa fa-check"></i> 查询
                        </button>
                        <button type="button" onclick="LoginLog.reset();"
                                class="btn btn-default btn-sm no-margin-top">
                            <i class="fa fa-refresh"></i>重置
                        </button>
                    </div>
                    <!-- /.box-footer -->
                </form>
            </div>
            <!-- /.box -->
        </div>
    </div><!-- /.row -->
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-success">
                <div class="box-body">
                    <div class="hidden-xs" id="loginLogTableToolbar" role="group">
                        <button type="button" onclick="LoginLog.clear();"
                                class="btn btn-success btn-sm no-margin-top">
                            清空日志
                        </button>
                    </div>
                    <table id="loginLogTable" data-mobile-responsive="true" data-click-to-select="true">
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section><!-- /.content -->
</body>
</html>
