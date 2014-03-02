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
        <h3><fmt:message key='school.campus.title'/></h3>
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

        <div id='tuition' style="margin-top: 15px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(221, 221, 221); ">
        <h3><fmt:message key='school.tuition.title'/></h3>
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
                            <div class="col col-xs-2 grid-overflow-ellipsis"
                                 data-fieldname="paytype">Item Type
                            </div>
                            <div class="col col-xs-2 grid-overflow-ellipsis text-right"
                                 data-fieldname="memo">Item Fee
                            </div>

                            <div class="col col-xs-3 grid-overflow-no-ellipsis"
                                 data-fieldname="moeny">Item Description
                            </div>
                        </div>
                        <div class="panel panel-warning" style="display: none;"></div>
                        <div class="divider row"></div>
                    </div>
                </div>
                <div class="panel-body">
                    <div id="tuition_rows" class="rows ui-sortable">
                    <% sn=0;%>
                    <% System.out.println("I'm here!");%>
                       <c:forEach var='tuition' items='${school.tuitionItems}'>
                            <% sn++;%>

                            <div class="grid-row" data-idx="<c:out value='${tuition.id}'/>">
                                <div class="data-row" style="min-height: 26px; display: block; ">
                                        <div class="col col-xs-1 row-index"><%=sn%></div>
                                        <div class="col col-xs-2 grid-overflow-ellipsis" data-fieldname="name"><c:out value='${tuition.name}'/></div>
                                        <div class="col col-xs-2 grid-overflow-ellipsis" data-fieldname="type"><c:out value='${tuition.type}'/></div>
                                        <div class="col col-xs-2 grid-overflow-ellipsis" data-fieldname="paytype"><c:out value='${tuition.payType}'/></div>

                                        <div class="col col-xs-2 grid-overflow-ellipsis text-right" data-fieldname="money">
                                                    <div style="text-align: right"><c:out value='${tuition.money}'/></div>
                                        </div>
                                        <div class="col col-xs-3 grid-overflow-no-ellipsis" data-fieldname="memo"><c:out value='${tuition.memo}'/></div>
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
                        <a href="#" id='tuition_add_row' class="grid-add-row">+ Add new row.</a>
                        <span class="text-muted">Click on row to edit.</span>
                    </div>

                </div>
            </div>
        </div>

    </div>

    <script src="/utimes/assets/js/utimes/schooledit2.js"> </script>
    </body>

</html>