<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.utimes.study.bean.UserBean"%>
<%@ page import="java.io.*,java.util.Locale" %>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="panel-heading">
    <div class="toolbar" style="height: 24px;">
        <span class="panel-title">Editing Row #<span  class="row-index"><c:out value="${rownumber}"/></span></span>
        <button class="btn btn-success pull-right grid-toggle-row" title="Close" style="margin-left: 7px;">
            <i class="icon-chevron-up"></i>
        </button>
        <button class="btn btn-default pull-right grid-insert-row" title="Insert Row" style="margin-left: 7px;">
            <i class="icon-plus grid-insert-row"></i>
        </button>
        <button class="btn btn-default pull-right grid-delete-row" title="Delete Row">
        <i class="icon-trash grid-delete-row"></i>
        </button>
    </div>
</div>
<div class="panel-body">
    <div class="form-area">
        <div class="row" style="padding: 0px 15px;">
            <div class="col-md-6">
                <div>
                    <div class="form-group" style="max-width: 600px;">
                        <label class="control-label">Item Name</label>
                        <div class="control-input">
                            <input type="text" class="text ui-widget-content ui-corner-all"  id="tuition_name" style="max-height: 100px;" >
                        </div>
                        <div class="control-value like-disabled-input" style="display: none;"></div>
                        <p class="help-box small text-muted">   &nbsp;</p>
                    </div>
                </div>
                <div>
                    <div class="form-group" style="max-width: 600px;">
                        <label class="control-label">Item Type</label>
                        <div class="control-input">
                            <input type="text" class="text ui-widget-content ui-corner-all" style=" max-height: 100px;" id="tuition_type">
                        </div>
                        <div class="control-value like-disabled-input" style="display: none;"></div>
                        <p class="help-box small text-muted">   &nbsp;</p>
                    </div>
                </div>

                <div>
                    <div class="form-group" style="max-width: 600px;">
                        <label class="control-label">Item Fee</label>
                        <div class="control-input">
                            <input type="text" class="text ui-widget-content ui-corner-all" style="text-align: right;max-height: 100px;" id="tuition_money">
                        </div>
                        <div class="control-value like-disabled-input" style="display: none;"></div>
                        <p class="help-box small text-muted">  &nbsp;</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">

                <div>
                    <div class="form-group">
                        <label class="control-label">Item description</label>
                        <div class="control-input">
                            <textarea    type="text" class="text ui-widget-content ui-corner-all" placeholder="" style="max-height: 100px;" id="tuition_memo"></textarea>
                        </div>
                        <div class="control-value like-disabled-input" style="display: none;"></div>
                        <p class="help-box small text-muted">  &nbsp;</p>
                    </div>
                </div>

                <div>

                    <div class="form-group" style="max-width: 600px;"><label class="control-label">Time to Pay</label>
                        <div class="control-input">
                            <input   type="text" class="text ui-widget-content ui-corner-all"
                                placeholder="" style="max-height: 100px;" id="tuition_paytype">
                        </div>
                        <div class="control-value like-disabled-input" style="display: none;"></div>
                        <p class="help-box small text-muted"> &nbsp;</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="toolbar footer-toolbar" style="height: 36px;">

        <button class="btn btn-success pull-right grid-toggle-row" title="Close" style="margin-left: 7px;">
        <i  class="icon-chevron-up"></i></button>
        <button class="btn btn-default pull-right grid-append-row" title="Insert Below" style="margin-left: 7px;">
        <i class="icon-plus"></i></button>
    </div>
</div>