<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.utimes.study.bean.UserBean"%>
<%@ page import="java.io.*,java.util.Locale" %>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="grid-row" data-idx="0">
    <div class="data-row" style="min-height: 26px; display: block; ">
            <div class="col col-xs-1 row-index">#</div>
            <div class="col col-xs-2 grid-overflow-ellipsis" data-fieldname="name"> </div>
            <div class="col col-xs-2 grid-overflow-ellipsis" data-fieldname="type"> </div>
            <div class="col col-xs-2 grid-overflow-ellipsis" data-fieldname="paytype"> </div>

            <div class="col col-xs-2 grid-overflow-ellipsis text-right" data-fieldname="money">
                        <div style="text-align: right">N$ 0.00</div>
            </div>
            <div class="col col-xs-3 grid-overflow-no-ellipsis" data-fieldname="memo"></div>
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