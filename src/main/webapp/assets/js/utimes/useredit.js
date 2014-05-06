/*
price search javascript.
*/
var hlApp=hlApp||{};

_.templateSettings = {
    interpolate: /\<\@\=(.+?)\@\>/gim,
    evaluate: /\<\@([\s\S]+?)\@\>/gim,
    escape: /\<\@\-(.+?)\@\>/gim
};

hlApp.debug= function(str)
{
    console.log("<DEBUG>"+str);
};

$(function(){

    hlApp.User=Backbone.Model.extend({
        defaults:function(){
            return {
                name:""
            };
        }
    });
    hlApp.UserList=Backbone.Collection.extend({
        model:hlApp.User,
        url:"/utimes/users"
    });


    var userList=new hlApp.UserList;


    hlApp.UserView = Backbone.View.extend({
        template:_.template($('#user_form_template').html()),
        render:function()
        {

            this.$el.html(this.template(this.model));
            hlApp.debug(this.$el);
            hlApp.debug(this.$el.html());
            return this;
        },

        save:function()
        {
            model.save();
        }

    });


    hlApp.UserListView = Backbone.View.extend({

    }
    );







    jQuery("#list4").jqGrid(
    {
            url : "users.htm?loaddata=true",
            datatype : "json",
            height : 250,
            colNames : [ '<fmt:message key="user.email"/>', '<fmt:message key="user.lastname"/>', '<fmt:message key="user.firstname"/>', 'Last Date',
                    'Register Date','<fmt:message key="user.description"/>' ],
            colModel : [ {
                name : 'email',
                index : 'email',
                width : 60
            }, {
                name : 'lastName',
                index : 'lastName',
                width : 100
            }, {
                name : 'firstName',
                index : 'firstName',
                width : 100
            } , {
                name : 'lastdate',
                index : 'lastdate',
                width : 90,
                sorttype : "date"
            }, {
                name : 'regdate',
                index : 'regdate',
                width : 90,
                sorttype : "date"
            },
            {
                name: 'description',
                index: 'description',
                width: 100
            }],
            autowidth:true,
            rownum:10,
            viewrecords: true,
            rowList:[10,20,30],
            pager: jQuery('#pager2'),
            multiselect : false,
            caption : "Registers List"
    }).navGrid('#pager2',{edit:false,add:false,del:false});
    jQuery("#new").button();
    jQuery("#modify").button();
    jQuery("#password").button();
    jQuery("#delete").button();

     //userList.fetch({reset:true});

});