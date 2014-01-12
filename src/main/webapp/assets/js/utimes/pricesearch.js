/*
price search javascript.
*/
var hlApp=hlApp||{};

$(function(){

    hlApp.School=Backbone.Model.extend({
        defaults:function(){
            return {
                name:""
            };
        }
    });
    hlApp.SchoolList=Backbone.Collection.extend({
        model:hlApp.School,
        url:"/utimes/schools"
    });

    hlApp.Course = Backbone.Model.extend({
        defaults:function(){
            return {
                name:""
            };
        }
    });
    hlApp.CourseList = Backbone.Collection.extend({
        model:hlApp.Course,
        url:function(){return "/utimes/schools/"+this.school.get("id")+"/courses";}
    });
    var schoolList=new hlApp.SchoolList;


    hlApp.TuitionItem = Backbone.Model.extend({
        defaults:function(){
            return {
                name:"",
                value:0
            }
        }
    })

    hlApp.SchoolPriceList = Backbone.Collection.extend({
        model:hlApp.TuitionItem,
        url:"/utimes/pricelists"
    });


    hlApp.SchoolPriceView = Backbone.View.extend({
        template:_.template($('#price_list_template').html()),
        render:function()
        {
            this.$el.html(this.template(this.model));
        }
    });

    var SearchForm = Backbone.View.extend({
        el:$('#searchform'),
        template:_.template($('#formtemplate').html()),
        events:{
            'change #schoolselect':'updateCourse',
            'click #comparebtn':'compare'
        },
        initialize:function()
        {
            console.log("this was called....");
            this.listenTo(schoolList,'reset',this.renderSchool);

        },
        updateCourse:function(){
            var schoolId=this.$('#schoolselect option:selected').val();
            console.log('<DEBUG> change trigger:'+this.$('#schoolselect option:selected').text()+' value:'+schoolId);
            this.$('#courseselect').html("");
            var school=schoolList.get(schoolId);
            this.schoolCourseList=new hlApp.CourseList;
            this.schoolCourseList.school=school;
            //this.schoolCourseList.school=;
            this.listenTo(this.schoolCourseList,'reset', this.renderCourse);
            this.schoolCourseList.fetch({reset:true});
        },
        renderOne:function(model)
        {
            console.log("<DEBUG> renderOne with:"+model);
            this.$('#schoolselect').append("<option value='"+model.get("id")+"'>"+model.get('name')+"</option>");
        },
        renderSchool:function()
        {
            schoolList.each(this.renderOne,this);

        },
        renderCourse:function(){
            var that=this;
            this.schoolCourseList.each(function(course){
               that.$('#courseselect').append($("<option value='"+course.get("id")+"'>"+course.get("name")+"</option>"));
            });
            //this.$('#courseselect').append($("<option value='"+course.get("id")+"'>"+course.get("name")+"</option>"));
        },
        compare:function()
        {
            console.log("<TRACE>compare was clicked.");
            var schoolId=this.$('#schoolselect option:selected').val();
            var theCourseId=this.$('#courseselect option:selected').val();
            var weeks= this.$('#weeks').val();
            if(schoolId && theCourseId)
            {
                var params= { data: $.param({ school: schoolId, course: theCourseId, weeks:weeks}) , success:function(){
                                                                                                            console.log("<TRACE>fetched data");
                                                                                                        }};
                var list=new hlApp.SchoolPriceList;
                list.fetch(params);
            }

        }

    });

    var searchForm=new SearchForm;
    schoolList.fetch({reset:true});

});