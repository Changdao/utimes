<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.utimes.study.bean.SchoolBean"%>
<%@ page import="java.io.*,java.util.Locale" %>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                //$('#edit-school-dialog').dialog("close");
            }
            //alert("this is called.Great!");
            $('#school-edit-form').ajaxForm(options_editSchool);

            $('#since').datepicker();
            var theSince=$('#since').val();
            console.log('since:'+theSince);
            $( "#since" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
            $( "#since" ).datepicker( "setDate", theSince);


            /*$('#edit-school-dialog').dialog({
                                                autoOpen : false,
                                                height : 600,
                                                width : 800,
                                                modal : true,
                                                buttons : {
                                                    "Update the school" : function() {
                                                               alert('here');
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
            $('#edit-school-dialog').dialog('open');  */

            $('#btnsaveschool').button().click(function(){
                //save it.
                var theactive=$('#tabs','#RightPane').tabs('option','active');
                console.log('got:'+theactive);
                $('#school-edit-form').submit();
                $("#tabs div[aria-hidden='false']").load('schools.htm');
            });
            $('#btncancelsave').button().click(function(){$("#tabs div[aria-hidden='false']").load('schools.htm');});

            $('#area').delegate('#area_add_row','click',
                function()
                {

                    console.log('display add panel:'+$(this));
                    //new area row
                    //panel open
                    // onsave = save the content.
                    //         savesuccessful= display row, hide panel
                    //                          set the school-id
                    var _datacount=$('#area_rows .grid-row').size();

                    $.get( "schoolarea.htm?action=new", function( data ) {
                        _thedata=data;

                        $( "#area_rows" ).append( data );
                        var _last=$('#area_rows .grid-row').last();
                        var _row_index=""+(_datacount+1);
                        _last.find('.row-index').html(_row_index);

                        var pnl=_last.children('.panel');
                        var row=_last.children('.data-row');
                        row.updateArea=function(obj)
                        {
                            row.find('div[data-fieldname="name"]').text(obj.name);
                            row.find('div[data-fieldname="memo"]').text(obj.memo);
                            row.find('div[data-fieldname="location"]').text(obj.location);
                            console.log('...I was called?');
                        }
                        var areaid=_last.attr('data-idx');
                        pnl.addClass("panel-open");
                        pnl.load("schoolarea.htm?action=loadpanel",function(){
                            pnl.find('.row-index').text(_row_index);
                            //clicked event handler.
                            pnl.find('.btn-success')
                            .click(
                                    function(){
                                                console.log('clicked me');
                                                var areaName=pnl.find('#area_name');
                                                var areaLocation=pnl.find('#area_location');
                                                var areaMemo=pnl.find('#area_memo');
                                                var schoolId=$('#id').val();
                                                console.log('school id:'+schoolId);
                                                console.log('areaname:'+areaName);
                                                console.log('areaname:'+areaName.val());

                                                 $.post('schoolarea.htm?action=save',
                                                        {schoolid:schoolId,
                                                         id:areaid,
                                                         name:areaName.val(),
                                                         location:areaLocation.val(),
                                                         memo:areaMemo.val()
                                                         },
                                                         function(data){
                                                                      console.log('return:'+data);
                                                                      var obj=$.parseJSON(data);
                                                                      console.log('return ojb:'+obj);
                                                                      console.log('return area id:'+obj.id);
                                                                      _last.attr('data-idx',obj.id);
                                                                      //todo: it is necessary to use closure to beautify the code
                                                                      row.updateArea(obj);
                                                         }
                                                 );
                                                 pnl.css('display','none');
                                                 row.css('display','block');
                                            }
                            );

                            pnl.css('display','block');
                            row.css('display','none');

                          }
                        );
                    });

                }
            );

            $('#area_rows').delegate('.grid-delete-row','click',
                        function()
                                {
                                 console.log('delete was clicked....');
                                 var the_utimes_area_row=$(this).parents('.grid-row');
                                 var that=$(this);

                                 if(the_utimes_area_row.size()>0)
                                 {
                                    //console.log('find:'+the_utimes_area_row.size());
                                    //console.log('is it:'+);
                                    var area_id= the_utimes_area_row.attr('data-idx');
                                    if(area_id>0)
                                    {
                                        $.get('schoolarea.htm',{action:'delete',id:area_id},
                                            function(response)
                                            {
                                                the_utimes_area_row.remove();
                                            }
                                        );
                                    }
                                    else
                                    {
                                        the_utimes_area_row.remove();
                                        //todo: recalc the sn
                                    }
                                 }
                                }
            );


            closePanels=function(openpnls){
                            //console.log(openpnls);
                            openpnls.children('.data-row').css('display','block');
                            openpnls.children('.panel').css('display','none');
                            openpnls.children('.panel').html('');
                            openpnls.removeClass('panel-open');
                        }

            $('#tuition_add_row').click(function(){

                        closePanels($('#tuition .panel-open'));

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
                            closePanels($('#tuition .panel-open'));
                            newrow.toggle_view();
                        });

                        newrow.toggle_view();

                    });

      });

    </script>
    </head>
    <body>
        <div> <a id='btnsaveschool' href="#">Save</a> <a id='btncancelsave' href="#">cancel</a>
        </div>
        <div  style="margin-top: 15px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); ">
        <h3>Basic Information</h3>
        <form id="school-edit-form" action="editschool.htm">
			<fieldset>
			    <input type="hidden" name="id" id="id" value="<c:out value='${school.id}'/>"/>
				<label for="name">Name</label>
				<input type="text" name="name"
					id="name" class="text ui-widget-content ui-corner-all" value="<c:out value='${school.name}'/>"/>
				<label
					for="location">Location</label>
				<input type="text" name="location"
					id="location" value="<c:out value='${school.location}'/>" class="text ui-widget-content ui-corner-all" />

				<label for"since"> Since:</label> <input class="text ui-widget-content ui-corner-all" type="text" name="since" id="since" value="<c:out value='${school.since}'/>"/>

				<label for="introduce">Introduce</label>

				<input type="text"
					name="introduce" id="introduce" value="<c:out value='${school.memo}'/>"
					class="text ui-widget-content ui-corner-all" />

			</fieldset>
		</form>
		</div>

        <div id="area" style="margin-top: 15px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); ">
        <h3>School Areas</h3>
           <div class="panel panel-default">
                           <div class="panel-heading" style="font-size: 9px;">
                               <div class="grid-row">
                                   <div class="data-row" style="min-height: 26px;">
                                       <div class="col col-xs-1 row-index">#</div>
                                       <div class="col col-xs-2 grid-overflow-ellipsis"
                                            data-fieldname="name">Area Name
                                       </div>
                                       <div class="col col-xs-2 grid-overflow-ellipsis"
                                            data-fieldname="type">Area Location
                                       </div>
                                       <div class="col col-xs-3 grid-overflow-no-ellipsis"
                                            data-fieldname="time_to_pay">Are Description
                                       </div>
                                   </div>
                                   <div class="panel panel-warning" style="display: none;"></div>
                                   <div class="divider row"></div>
                               </div>
                           </div>
                           <div class="panel-body">
                               <div id="area_rows" class="rows ui-sortable">
                               <% int sn=0;%>
                               <c:forEach var='area' items='${school.areas}'>
                                    <% sn++;%>
                                    <div class="grid-row" data-idx="<c:out value='${area.id}'/>">
                                        <div class="data-row" style="min-height: 26px; display: block; ">
                                                <div class="col col-xs-1 row-index"><%=sn%></div>
                                                <div class="col col-xs-2 grid-overflow-ellipsis" ><c:out value='${area.name}'/> </div>
                                                <div class="col col-xs-2 grid-overflow-ellipsis" ><c:out value='${area.location}'/> </div>

                                                <div class="col col-xs-3 grid-overflow-no-ellipsis" data-fieldname="memo"><c:out value='${area.memo}'/></div>
                                                <div class="col-md-1 pull-right" style="text-align: right; padding-right: 5px;">
                                                            <button class="btn btn-small btn-success grid-insert-row" style="padding: 4px;">
                                                            <i class="icon icon-plus-sign"></i> </button>
                                                            <button class="btn btn-small btn-default grid-delete-row" style="padding: 4px;">
                                                            <i class="icon icon-trash"></i></button>
                                                </div>
                                        </div>
                                        <div class="panel panel-warning" style="display: none; "></div>
                                        <div class="divider row"></div>
                                    </div>
                               </c:forEach>


                               </div>
                               <div style="margin-top: 5px; margin-bottom: -5px;">
                                   <a href="#" id='area_add_row' class="grid-add-row">+ Add new area.</a>
                                   <span class="text-muted">Click on row to edit.</span>
                               </div>

                           </div>
           </div>
        </div>

        <div id='tuition' style="margin-top: 15px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); ">
        <h3>Tuition Items</h3>
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


        <div id='course' style="margin-top: 15px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); ">
            <h3>Tuition Items</h3>
            <div class="panel panel-default">
                <div class="panel-heading" style="font-size: 9px;">
                    <div class="grid-row">
                        <div class="data-row" style="min-height: 26px;">
                            <div class="col col-xs-1 row-index">#</div>
                            <div class="col col-xs-2 grid-overflow-ellipsis"
                                 data-fieldname="name">Course Name
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


    </body>

</html>