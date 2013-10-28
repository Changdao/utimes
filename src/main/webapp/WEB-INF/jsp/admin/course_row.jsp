<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.utimes.study.bean.UserBean"%>
<%@ page import="java.io.*,java.util.Locale" %>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="grid-row" data-idx="<c:out value='${area.id}'/>">
    <div class="data-row" style="min-height: 26px; display: block; ">
            <div class="col col-xs-1 row-index">#</div>
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