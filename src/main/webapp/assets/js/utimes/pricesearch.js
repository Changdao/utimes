/*
price search javascript.
*/
var hlApp=hlApp||{};

$(function(){

    hlApp.School=Backbone.Model.extend({

    });
    hlApp.SchoolList=Backbone.Collection.extend({
        model:hlApp.School,
        url:"/utimes/schools"
    });

    var schoolList=new hlApp.SchoolList;
    var SearchForm = Backbone.View.extend({
        el:$('#searchform'),
        template:_.template($('#formtemplate').html()),
        events:{
            'change #schoolselect':'updateCourse'
        },
        initialize:function()
        {
            this.listenTo(schoolList,'reset',this.render);
        },
        updateCourse:function(){
            console.log('<DEBUG> change trigger:'+this.$('#schoolselect option:selected').text()+' value:'+this.$('#schoolselect option:selected').val())
        },
        renderOne:function()
        {
        },
        render:function()
        {
            schoolList.each(this.renderOne,this);
            this.$('#schoolselect').append($('<option value="v1">oooo</option>'));
            this.$('#schoolselect').append($('<option value="v2">kkkk</option>'));

        }

    });

    var searchForm=new SearchForm;
    searchForm.render();

});