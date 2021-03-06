/**
 * 字典管理初始化
 */
var Dict = {
    id: "dictTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Dict.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
        {title: 'id', field: 'id', visible: false, align: 'center', valign: 'middle'},
        {title: '名称(值)', field: 'name', align: 'center', valign: 'middle', sortable: true},
        {title: '编码(键)', field: 'code', align: 'center', valign: 'middle', sortable: true},
        {title: '详情', field: 'detail', align: 'center', valign: 'middle', sortable: false},
        {title: '备注', field: 'tips', align: 'center', valign: 'middle', sortable: false}];
};

/**
 * 检查是否选中
 */
Dict.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if (selected.length == 0) {
        Feng.info("请先选中表格中的某一记录！");
        return false;
    } else {
        Dict.seItem = selected[0];
        return true;
    }
};

/**
 * 获取数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
Dict.get = function (key) {
    return $("#" + key).val();
};

/**
 * 设置收集数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
Dict.set = function (key, val) {
    this.queryData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
};

/**
 * 清除数据
 */
Dict.clearData = function () {
    this.queryData = {};
}

/**
 * 收集数据
 */
Dict.collectData = function () {
    this.clearData();
    this.set('name')
        .set('tips');
};

/**
 * 点击添加字典
 */
Dict.openAddPage = function () {
    var index = layer.open({
        type: 2,
        title: '添加字典',
        area: ['750px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/dict/add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看字典详情
 */
Dict.openEditPage = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '字典详情',
            area: ['750px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/dict/edit/' + Dict.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除字典
 */
Dict.delDict = function () {
    if (this.check()) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/dict/delete", function (data) {
                Feng.success("删除成功!");
                Dict.table.refresh();
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("dictId", Dict.seItem.id);
            ajax.start();
        };
        Feng.confirm("是否刪除字典 " + Dict.seItem.name + "?", operation);
    }
};

/**
 * 查询字典列表
 */
Dict.search = function () {
    this.collectData();
    Dict.table.refresh({query: this.queryData});
};

//高级重置
Dict.reset = function () {
    $("form .form-group input").val("");
};

$(function () {
    var defaultColunms = Dict.initColumn();
    var table = new BSTable(Dict.id, "/dict/list", defaultColunms);
    table.setPaginationType("server");
    Dict.table = table.init();

    $("#system").attr("class", "active");
    $("#dict").attr("class", "active");
});
