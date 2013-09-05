

<html>
    <head>
    <link rel="stylesheet" href="/utimes/css/jquery-ui-1.9.2.custom.css" />
    <link rel="stylesheet" href="/utimes/css/utimes.css" />
    <link rel="stylesheet" href="/utimes/css/ui.jqgrid.css" />
    <link rel="stylesheet" href="/utimes/css/bootstrap.css"/>
    <link rel="stylesheet" href="/utimes/css/fontawesome.css"/>
    <script src="/utimes/js/jquery-ui-1.9.2.custom.js"></script>
    <script src="/utimes/js/jquery.form.js"></script>
    <script src="/utimes/js/jquery.jqGrid.min.js" > </script>
    <script src="/utimes/js/jquery.layout.js"></script>
    <script src="/utimes/js/grid.locale-cn.js"> </script>
    <script type="text/javascript">
     $(function(){

    		var options_editSchool = {
                    beforeSubmit:  showRequest_editSchool,  // pre-submit callback
                    success:       showResponse_editSchool  // post-submit callback
                };



            // pre-submit callback
            function showRequest_editSchool(formData, jqForm, options) {
                /*var queryString = $.param(formData);
                //alert('About to submit the edit school: \n\n' + queryString);*/
                return true;
            }

            // post-submit callback
            function showResponse_editSchool(responseText, statusText, xhr, $form)  {

                //var datarow = jQuery.parseJSON(responseText);
                //var su=jQuery("#schools").jqGrid('addRowData',datarow.id,datarow);
                //if(!su) alert("Can not update");
                //alert("showResponse_editSchool was called");
                $('#edit-school-dialog').dialog("close");
            }
           //alert("this is called.Great!");
           $('#school-edit-form').ajaxForm(options_editSchool);

           $('#since').datepicker();
           $('#edit-school-dialog').dialog({
                       							autoOpen : false,
                       							height : 600,
                       							width : 800,
                       							modal : true,
                       							buttons : {
                       								"Update the school" : function() {
                                                               $('#school-edit-form').submit();
                       								},
                       								Cancel : function() {
                       									$(this).dialog("close");
                       								}
                       							},
                       							close : function() {
                       								//allFields.val("").removeClass("ui-state-error");
                       							}
                       						}
           		    );
           $('#edit-school-dialog').dialog('open');

            closePanels=function(openpnls){
                            //console.log(openpnls);
                            openpnls.children('.data-row').css('display','block');
                            openpnls.children('.panel').css('display','none');
                            openpnls.children('.panel').html('');
                            openpnls.removeClass('panel-open');
                        }

            $('#tuition_add_row').click(function(){

                        closePanels($('.panel-open'));

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
                        newrow.rownumber=cnt;
                        newrow.appendTo('#tuition_rows');


                        newrow.toggle_view=function(){

                            newrow.addClass("panel-open");
                            var pnl=this.children('.panel');
                            //alert(pnl);
                            pnl.load('school_edit.htm?loadtuitionpanel=true&rownumber='+newrow.rownumber,function()
                            {
                                console.log('panel:'+pnl);
                                console.log('children:'+pnl.children('.grid-toggle-row'));
                                console.log('newrow:'+newrow);
                                $('.grid-toggle-row',pnl).click(function(event){

                                                                closePanels(newrow);
                                                                event.stopPropagation();

                                                            });
                            }
                            );


                            pnl.css('display','block');
                            this.children('.data-row').css('display','none');
                        };

                        newrow.click(function(){
                            if(newrow.hasClass('panel-open'))return;
                            closePanels($('.panel-open'));
                            newrow.toggle_view();
                        });

                        newrow.toggle_view();

                    });

      });

    </script>
    </head>
    <body>
        <div>
        <form id="school-edit-form" action="editschool.htm">
			<fieldset>
				<label for="name">Name</label>
				<input type="text" name="name"
					id="name" class="text ui-widget-content ui-corner-all" />
				<label
					for="location">Location</label>
				<input type="text" name="location"
					id="location" value="" class="text ui-widget-content ui-corner-all" />

				<label for"since"> Since:</label> <input class="text ui-widget-content ui-corner-all" type="text" id="since" />

				<label for="introduce">Introduce</label>

				<input type="text"
					name="introduce" id="introduce" value=""
					class="text ui-widget-content ui-corner-all" />

				<label for="classroom">Classroom</label>
				<input type="text" name="classroom" value="" class="text ui-widget-content ui-corner-all" />
			</fieldset>
		</form>
		</div>

		<div class="panel panel-default">
        <div class="panel-heading" style="font-size: 9px;">
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

    </body>

</html>