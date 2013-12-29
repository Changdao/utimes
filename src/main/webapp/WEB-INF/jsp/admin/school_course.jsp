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
    <link rel="stylesheet" href="/utimes/assets/css/jquery-ui-1.9.2.custom.css" />
    <link rel="stylesheet" href="/utimes/assets/css/utimes.css" />
    <link rel="stylesheet" href="/utimes/assets/css/ui.jqgrid.css" />
    <link rel="stylesheet" href="/utimes/assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="/utimes/assets/css/fontawesome.css"/>
    <script src="/utimes/assets/js/jquery-ui-1.9.2.custom.js"></script>
    <script src="/utimes/assets/js/jquery.form.js"></script>
    <script src="/utimes/assets/js/jquery.jqGrid.min.js" > </script>
    <script src="/utimes/assets/js/jquery.layout.js"></script>
    <script src="/utimes/assets/js/grid.locale-cn.js"> </script>
    <script type="text/javascript">
     $(function(){
        $('#btn_return').button().click(function(){$("#tabs div[aria-hidden='false']").load('schools.htm');});

        $('#courses_main').on('click','.grid-delete-row',function(event){
            console.log('grid-delete-row was clicked.');
            var theButton=$(event.target)
            var theRow=theButton.parents('.grid-row');
            var theDataId=theRow.attr('data-idx');
            $.post('schoolcourse.htm?action=delete',{id:theDataId},function()
            {
                console.log('delete returned.');
                theRow.remove();

            });
            console.log('event want stop propagation:'+event);
            event.stopPropagation();
        });

        $('#courses_main').on('refresh','.data-row',function(event,obj){
            console.log('refresh was triggered on :'+$(this)[0].nodeName);
            $(this).find('div[data-fieldname="name"]').text(obj.name);
            $(this).find('div[data-fieldname="memo"]').text(obj.memo);
            $(this).find('div[data-fieldname="moneyRate"]').text(obj.moneyRate);
        });


        $('#courses_main').on('click','.grid-toggle-row',function(event){
            console.log('grid-toggle-row was clicked, this is:'+$(this).html());
            var theButton=$(event.target);
            console.log('evnet.target html:'+theButton.html());

            var theRow=theButton.parents('.grid-row');

            var theAreaId=theRow.parents('.area').attr('data-idx');



            var pnl=theButton.parents('.panel-container'); //the closet one.
            console.log('panel:'+pnl.size());
            var dataRow=theRow.find('.data-row');
            console.log('datarow:'+dataRow.size());

            var courseName=pnl.find('#course_name').val();
            var courseMoney=pnl.find('#course_money').val();
            var courseMemo=pnl.find('#course_memo').val();

            console.log('course name:'+courseName);
            console.log('course money:'+courseMoney);
            console.log('course memo:'+courseMemo);

            $.post('schoolcourse.htm?action=save',{name:courseName,money:courseMoney,memo:courseMemo,areaId:theAreaId},function(data)
            {
                console.log('save result:'+data);
                var resultJSON=$.parseJSON(data);
                console.log('dataRow.size:'+dataRow.size());
                dataRow.trigger('refresh',[resultJSON]);

                pnl.css('display','none');
                dataRow.css('display','block');
            });

        });

        $('#courses_main').on('click','.data-row',function(event)
        {
            console.log('.data-row .click was triggered on:'+$(this)[0].nodeName);
            $(this).parent().trigger('toggleEdit');

        });


        $('#courses_main').on('toggleEdit','.grid-row',function()
        {
              console.log('toggleEdit was triggered on:'+$(this)[0].nodeName);
              var _last=$(this);
              var _row_index=_last.find('.row-index').text();
              var pnl=_last.children('.panel');
              var row=_last.children('.data-row');

              pnl.addClass("panel-open");
              pnl.load("schoolcourse.htm?action=loadpanel",function(){
                  pnl.find('.row-index').text(_row_index);
                  pnl.css('display','block');
                  row.css('display','none');
                }
              );
        });

        $('#courses_main').on('new','.panel-body',function()
        {

            var theRows=$(this).find('#courses_rows');

            $.get( "schoolcourse.htm?action=new", function( data ) {
                                    _thedata=data;
                                    var _datacount=theRows.find('.grid-row').size();
                                    var _row_index=""+(_datacount+1);
                                    theRows.append( data );
                                    var _last=theRows.find('.grid-row').last();
                                    _last.find('.row-index').html(_row_index);
                                    _last.trigger('toggleEdit');

                                });
        });

        $('#courses_main').on('click','#course_add_row',function(){
            console.log(this);
            $(this).parents('.panel-body').trigger('new');

        });

      });

    </script>
    </head>
    <body>
        <div id="courses_main">
        <div>
        <a id='btn_return' href="#">Return</a>

        </div>
        <c:forEach var="area" items='${school.areas}'>
            <div id='area_<c:out value="${area.id}"/>' style="margin-top: 15px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); " data-idx="<c:out value='${area.id}'/>" class="area">
                <h3>Area:<c:out value="${area.name}"/></h3>
               <div class="panel panel-default">
                               <div class="panel-heading" style="font-size: 9px;">
                                   <div class="grid-row">
                                       <div class="data-row" style="min-height: 26px;">
                                           <div class="col col-xs-1 row-index">#</div>
                                           <div class="col col-xs-2 grid-overflow-ellipsis"
                                                data-fieldname="name">Course Name
                                           </div>
                                           <div class="col col-xs-2 grid-overflow-ellipsis"
                                                data-fieldname="type">Course Money(4 weeks)
                                           </div>
                                           <div class="col col-xs-3 grid-overflow-no-ellipsis"
                                                data-fieldname="time_to_pay">Course Description
                                           </div>
                                       </div>
                                       <div class="panel panel-warning" style="display: none;"></div>
                                       <div class="divider row"></div>
                                   </div>
                               </div>
                               <div class="panel-body">
                                   <div id="courses_rows" class="rows ui-sortable">
                                   <% int sn=0;%>
                                   <c:forEach var='course' items='${area.courses}'>
                                        <% sn++;%>
                                        <div class="grid-row" data-idx="<c:out value='${course.id}'/>">
                                            <div class="data-row" style="min-height: 26px; display: block; ">
                                                    <div class="col col-xs-1 row-index"><%=sn%></div>
                                                    <div class="col col-xs-2 grid-overflow-ellipsis" data-fieldname="name"><c:out value='${course.name}'/> </div>
                                                    <div class="col col-xs-2 grid-overflow-ellipsis" data-fieldname="moneyRate"><c:out value='${course.moneyRate}'/> </div>

                                                    <div class="col col-xs-3 grid-overflow-no-ellipsis" data-fieldname="memo"><c:out value='${course.memo}'/></div>
                                                    <div class="col-md-1 pull-right" style="text-align: right; padding-right: 5px;">
                                                                <button class="btn btn-small btn-success grid-insert-row" style="padding: 4px;">
                                                                <i class="icon icon-plus-sign"></i> </button>
                                                                <button class="btn btn-small btn-default grid-delete-row" style="padding: 4px;">
                                                                <i class="icon icon-trash"></i></button>
                                                    </div>
                                            </div>
                                            <div class="panel panel-warning panel-container" style="display: none; "></div>
                                            <div class="divider row"></div>
                                        </div>
                                   </c:forEach>


                                   </div>
                                   <div style="margin-top: 5px; margin-bottom: -5px;">
                                       <a href="#" id='course_add_row' class="grid-add-row">+ Add new course.</a>
                                       <span class="text-muted">Click on row to edit.</span>
                                   </div>

                               </div>
               </div>
            </div>
        </c:forEach>
       </div>
    </body>

</html>