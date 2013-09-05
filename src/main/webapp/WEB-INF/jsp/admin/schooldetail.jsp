<html lang="zh_CN">
<head>
    <meta charset="utf-8"/>
    <title>Utimes Register Page</title>
    <link rel="stylesheet" href="/utimes/css/jquery.ui.all.css"/>
    <link rel="stylesheet" href="/utimes/css/utimes.css"/>
    <link rel="stylesheet" href="/utimes/css/ui.jqgrid.css"/>
    <link rel="stylesheet" href="/utimes/css/erpnext-all.css"/>
    <script src="/utimes/js/jquery-1.9.1.js"></script>
    <script src="/utimes/js/jquery-ui.js"></script>
    <script src="/utimes/js/jquery.jqGrid.min.js"/>
    </script>
    <script src="/utimes/js/grid.locale-cn.js"/>
    </script>


    <script type="text/javascript">
        $(function() {

        //$('div').filter(function() {return $(this).attr('data-idx'); }).each(function() {  alert(this)});
        $('#tuition_add_row').click(function(){

            $('.panel-open').children('.data-row').css('display','block');
            $('.panel-open').children('.panel').css('display','none');
            $('.panel-open').children('.panel').html('');
            $('.panel-open').removeClass('panel-open');

            var cnt=$('#tuition_rows').children().size()+1;
            var newrow=$('<div class="grid-row" data-idx="1">'+
        '<div class="data-row" style="min-height: 26px;">'+
            '<div class="col col-xs-1 row-index">'+cnt+'</div>'+
            '<div class="col col-xs-2 grid-overflow-ellipsis"'+
                 ' data-fieldname="company_name"> '+
            '</div> '+
            '<div class="col col-xs-2 grid-overflow-ellipsis" '+
                  ' data-fieldname="designation"></div> '+
            '<div class="col col-xs-2 grid-overflow-ellipsis text-right" ' +
                 ' data-fieldname="salary"> '+
                ' <div style="text-align: right">N$ 0.00</div> '+
            ' </div> '+
            ' <div class="col col-xs-3 grid-overflow-no-ellipsis" '+
                 ' data-fieldname="address"></div> '+
            '<div class="col-md-1 pull-right" '+
                 'style="text-align: right; padding-right: 5px;"> '+
                '<button class="btn btn-small btn-success grid-insert-row" '+
                        ' style="padding: 4px;"> '+
                    ' <i class="icon icon-plus-sign"></i> '+
                '</button>'+
                '<button class="btn btn-small btn-default grid-delete-row" '+
                        ' style="padding: 4px;"> '+
                    '<i class="icon icon-trash"></i>'+
                '</button>'+
            '</div>'+
        '</div>'+
        '<div class="panel panel-warning" style="display: none;"></div>'+
        '<div class="divider row"></div>'+
    '</div>');
            newrow.appendTo('#tuition_rows');


            newrow.toggle_view=function(){
                newrow.addClass("panel-open");
                var pnl=this.children('.panel');
                alert(pnl);
                pnl.html('<div class="panel-heading"> <div class="toolbar" style="height: 36px;">  <span class="panel-title">Editing Row #<span  class="row-index">2</span></span><button class="btn btn-success pull-right grid-toggle-row" title="Close" style="margin-left: 7px;"><i          class="icon-chevron-up"></i></button><button class="btn btn-default pull-right grid-insert-row" title="Insert Row" style="margin-left: 7px;"><i class="icon-plus grid-insert-row"></i></button><button class="btn btn-default pull-right grid-delete-row" title="Delete Row"><i class="icon-trash grid-delete-row"></i></button></div>        </div>        <div class="panel-body"><div class="form-area"><div class="row" style="padding: 0px 15px;"><div class="col-md-6"><div><div class="form-group" style="max-width: 600px;"><label class="control-label">Company</label><div class="control-input"><input type="text" class="col-md-12 input-with-feedback form-control" data-fieldtype="Data" data-fieldname="company_name" placeholder="" data-doctype="Employee External Work History" style="max-height: 100px;"></div><div class="control-value like-disabled-input" style="display: none;"></div><p class="help-box small text-muted">   &nbsp;</p></div></div><div><div class="form-group" style="max-width: 600px;"><label class="control-label">Salary</label><div class="control-input"><input    type="text" class="col-md-12 input-with-feedback form-control" data-fieldtype="Currency" data-fieldname="salary" placeholder="" data-doctype="Employee External Work History" style="text-align: right; max-height: 100px;"></div><div class="control-value like-disabled-input" style="display: none;"></div><p class="help-box small text-muted">   &nbsp;</p></div></div><div><div class="form-group" style="max-width: 600px;"><label class="control-label">Contact</label><div class="control-input"><input type="text" class="col-md-12 input-with-feedback form-control" data-fieldtype="Data" data-fieldname="contact" placeholder="" data-doctype="Employee External Work History" style="max-height: 100px;"></div><div class="control-value like-disabled-input" style="display: none;"></div><p class="help-box small text-muted">  &nbsp;</p></div></div></div><div class="col-md-6"><div><div class="form-group" style="max-width: 600px;"><label class="control-label">Designation</label><div class="control-input"><input    type="text" class="col-md-12 input-with-feedback form-control" data-fieldtype="Data" data-fieldname="designation" placeholder="" data-doctype="Employee External Work History" style="max-height: 100px;"></div><div class="control-value like-disabled-input" style="display: none;"></div><p class="help-box small text-muted">   &nbsp;</p></div></div><div><div class="form-group"><label class="control-label">Address</label><div class="control-input"><textarea    type="text" class="col-md-12 input-with-feedback form-control" data-fieldtype="Small Text" data-fieldname="address" placeholder="" data-doctype="Employee External Work History" style="max-height: 100px;"></textarea></div><div class="control-value like-disabled-input" style="display: none;"></div><p class="help-box small text-muted">  &nbsp;</p></div></div><div><div class="form-group" style="max-width: 600px;"><label         class="control-label">Total Experience</label><div class="control-input"><input   type="text" class="col-md-12 input-with-feedback form-control" data-fieldtype="Data" data-fieldname="total_experience" placeholder="" data-doctype="Employee External Work History" style="max-height: 100px;"></div><div class="control-value like-disabled-input" style="display: none;"></div><p class="help-box small text-muted"> &nbsp;</p></div></div></div></div></div>  <div class="toolbar footer-toolbar" style="height: 36px;"> <span class="text-muted"><a href="#" class="shortcuts"><i  class="icon-keyboard"></i> Shortcuts</a></span>  <button class="btn btn-success pull-right grid-toggle-row" title="Close" style="margin-left: 7px;"><i  class="icon-chevron-up"></i></button>  <button class="btn btn-default pull-right grid-append-row" title="Insert Below" style="margin-left: 7px;"> <i class="icon-plus"></i></button></div> </div>');
                pnl.css('display','block');
                this.children('.data-row').css('display','none');
            };

            newrow.click(function(){

                newrow.toggle_view();
            });

            newrow.toggle_view();

        });

        });


    </script>
</head>
<body>
<div id="main-container">
    <div style="border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221);">
        <h3 class="col-md-12" style="font-weight: bold;"> School tuition policy</h3>

        <div class="col-md-12" style="height: 20px;"></div>
        <div style="padding: 0px 3%">
            <div class="form-column col-md-12">
                <form>
                    <fieldset>
                        <div>
                            <div>
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="font-size: 15px;">
                                        <div class="grid-row">
                                            <div class="data-row" style="min-height: 26px;">
                                                <div class="col col-xs-1 row-index">#</div>
                                                <div class="col col-xs-2 grid-overflow-ellipsis"
                                                     data-fieldname="name">Item Name
                                                </div>
                                                <div class="col col-xs-2 grid-overflow-ellipsis"
                                                     data-fieldname="type">Item Type
                                                </div>
                                                <div class="col col-xs-2 grid-overflow-ellipsis text-right"
                                                     data-fieldname="description">Item Description
                                                </div>
                                                <div class="col col-xs-3 grid-overflow-no-ellipsis"
                                                     data-fieldname="time_to_pay">Time to pay
                                                </div>
                                            </div>
                                            <div class="panel panel-warning" style="display: none;"></div>
                                            <div class="divider row"></div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div id="tuition_rows" class="rows ui-sortable">


                                        </div>
                                        <div style="margin-top: 5px; margin-bottom: -5px;">
                                            <a href="#" id='tuition_add_row' class="grid-add-row">+ Add new row.</a>
                                            <span class="text-muted">Click on row to edit.</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>