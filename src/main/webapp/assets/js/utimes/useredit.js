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
        urlRoot:"/utimes/users",
        idAttribute:"id",
        defaults:function(){
            return {
                firstName:"",
                lastName:"",
                email:"",
                description:""
            };
        }
    });
    hlApp.UserList=Backbone.Collection.extend({
        model:hlApp.User,
        url:"/utimes/users"
    });


    var userList=new hlApp.UserList;


    hlApp.UserFormView = Backbone.View.extend({
        el:$('#dialog-form'),
        template:_.template($('#user_form_template').html()),
        events:{
            'click #save':'saveUser'
        },
        initialize: function() {
              this.listenTo(this.model, 'change', this.render);
        },
        render:function()
        {
            hlApp.debug(this.model);

            this.$el.html(this.template(this.model.toJSON()));
        },
        show:function()
        {

            this.render(this.model);
            this.$el.dialog({autoOpen : false,
                            height : 600,
                            width : 800,
                            modal : true,
                            });
            this.$('#save').button();

            this.$el.dialog("open");
        },
        saveUser:function()
        {
            //value bind to model
            //model save
            //
            this.stopListening();
            hlApp.debug(this.$('#firstname').val());
            hlApp.debug(this.$('#lastname').val())
            this.model.set("firstName",this.$('#firstname').val());
            this.model.set("lastName",this.$('#lastname').val()) ;
            this.model.set("email", this.$('#email').val());
            this.model.set("description", this.$('#description').val());
            console.log(this.model);
            var that= this.$el;
            this.model.save({},{success:function(){
                $('#list4').trigger( 'reloadGrid' );
                that.dialog("close");
            }});

        }
    });

    hlApp.UserView = Backbone.View.extend({
        template:_.template($('#user_view_template').html()),
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
        el:$('#user-main-container'),
        events:{
            'click #newUser':'addUser',
            'click #modifyUser':'modifyUser',
            'click #deleteUser' : 'deleteUser'
        },
        initialize:function()
        {
            this.$("#newUser").button();
            this.$("#modifyUser").button();
            this.$("#passwordUser").button();
            this.$("#deleteUser").button();

        },
        addUser:function()
        {
            var userForm = new hlApp.UserFormView({model:new hlApp.User});
            userForm.show();
        },
        modifyUser:function()
        {

        },
        deleteUser:function()
        {
            var id=this.$('#list4').jqGrid('getGridParam','selrow');
            hlApp.debug("want to delete"+id);
            var toDelModel= new hlApp.User({id:id});
            toDelModel.destroy({wait: true,success:function(model, response){

                $('#list4').trigger( 'reloadGrid' );
            },error:function(model,response){
                console.log(model);
                console.log(response);
                $('#list4').trigger( 'reloadGrid' );
            }});

        }
    }
    );

    //this should be reneded into.
    //to work with backbone.
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

    var ulv=new hlApp.UserListView;
     //userList.fetch({reset:true});

});