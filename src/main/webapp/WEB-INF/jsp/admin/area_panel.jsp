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
        <span class="panel-title">Editing Row #<span  class="row-index">#</span></span>
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
                        <label class="control-label">Area Name</label>
                        <div class="control-input">
                            <input type="text" class="text ui-widget-content ui-corner-all" id='area_name' style="max-height: 100px;">
                        </div>
                        <div class="control-value like-disabled-input" style="display: none;"></div>
                        <p class="help-box small text-muted">   &nbsp;</p>
                    </div>
                </div>
                <div>
                    <div class="form-group" style="max-width: 600px;">
                        <label class="control-label">Area Location</label>
                        <div class="control-input">
                            <input type="text" class="text ui-widget-content ui-corner-all" id='area_location' style="text-align: right; max-height: 100px;">
                        </div>
                        <div class="control-value like-disabled-input" style="display: none;"></div>
                        <p class="help-box small text-muted">   &nbsp;</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <div class="form-group">
                        <label class="control-label">Area Memo</label>
                        <div class="control-input">
                            <textarea type="text" id='area_memo' class="text ui-widget-content ui-corner-all" placeholder="" style="height:90%;width:90%;max-height: 100px;"></textarea>
                        </div>
                        <div class="control-value like-disabled-input" style="display: none;"></div>
                        <p class="help-box small text-muted">  &nbsp;</p>
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