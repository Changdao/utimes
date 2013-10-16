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

      });

    </script>
    </head>
    <body>
        <div>
        <a id='btn_return' href="#">Return</a>

        </div>
        <c:forEach var="area" items='${school.areas}'>
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
                                   <c:forEach var='course' items='${area.courses}'>
                                        <% sn++;%>
                                        <div class="grid-row" data-idx="<c:out value='${area.id}'/>">
                                            <div class="data-row" style="min-height: 26px; display: block; ">
                                                    <div class="col col-xs-1 row-index"><%=sn%></div>
                                                    <div class="col col-xs-2 grid-overflow-ellipsis" data-fieldname="name"><c:out value='${area.name}'/> </div>
                                                    <div class="col col-xs-2 grid-overflow-ellipsis" data-fieldname="location"><c:out value='${area.location}'/> </div>

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
        </c:forEach>

    </body>

</html>