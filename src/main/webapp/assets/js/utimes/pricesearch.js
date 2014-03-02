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

    hlApp.TuitionItemView = Backbone.View.extend({
        tagName: 'div',
        attributes:{
          "class":"row"
        },
        template:_.template($('#price_list_item_template').html()),
        render:function()
        {

            this.$el.html(this.template(this.model));
            hlApp.debug(this.$el);
            hlApp.debug(this.$el.html());
            return this;
        }
    })


    hlApp.SchoolPriceList = Backbone.Collection.extend({
        model:hlApp.TuitionItem,
        url:"/utimes/pricelists"

    });

    hlApp.PriceListModel = Backbone.Model.extend({
        defaults:function()
        {  return {
             schoolName:"",
             items:[],
             total:0
        };
        },


        url:function()
        {
            return "/utimes/pricelists?school="+this.schoolId+"&course="+this.courseId+"&weeks="+this.weeks;
        },

        initialize:function(props,opts)
        {
            this.schoolId=opts.schoolId;
            this.courseId=opts.courseId;
            this.weeks=opts.weeks;
        }

    });

    hlApp.SchoolPriceView = Backbone.View.extend({

        template:_.template($('#price_list_template').html()),

        render:function(priceList)
        {
            this.$el.html(this.template(priceList.toJSON()));
            this.renderItems(priceList);
            hlApp.debug(this.$el.html());
            return this;
        },

        resetContent:function()
        {
            this.$('.price').html("");
            this.$('#items').html("");
        },
        renderItems:function()
        {
            this.resetContent();

            this.list.each(this.renderOneItem,this);
            this.$('.price').html("Rendered!");
        },

        renderOneItem:function(item)
        {
            var view=new hlApp.TuitionItemView({model:item});
            this.$('#items').append(view.render().el);
        },

        listenEvents:function()
        {
            this.listenTo(this.list,'reset',this.renderItems);
            this.listenTo(this.list,'add',this.renderOneItem);
        }

    });

    hlApp.SchoolPriceView2=Backbone.View.extend({

          template:_.template($('#price_list_template').html()),

          render:function(priceList)
          {
              this.resetContent();
              var items=this.model.get("items");
              for(var i =0;i<items.length;i++){
                this.renderOneItem(items[i]);
              }
              var num= this.model.get("total");
              this.$('.price').html("<small>$"+num.toFixed(2)+"</small>");
              this.$('#schoolName').html("<h3>"+this.model.get("schoolName")+"</h3");
              hlApp.debug(this.$el.html());
              return this;
          },

          resetContent:function()
          {
              this.$('.price').html("");
              this.$('#items').html("");
              this.$('#schoolName').html("");
          },

          renderOneItem:function(item)
          {
              var view=new hlApp.TuitionItemView({model:item});
              this.$('#items').append(view.render().el);
          },

          listenEvents:function()
          {
              this.listenTo(this.model,'change',this.render);
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
            hlApp.debug("this was called....");
            this.listenTo(schoolList,'reset',this.renderSchool);

        },
        updateCourse:function(){
            var schoolId=this.$('#schoolselect option:selected').val();
            hlApp.debug('<DEBUG> change trigger:'+this.$('#schoolselect option:selected').text()+' value:'+schoolId);
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
            hlApp.debug("<DEBUG> renderOne with:"+model);
            this.$('#schoolselect').append("<option value='"+model.get("id")+"'>"+model.get('name')+"</option>");
        },
        renderSchool:function()
        {
            schoolList.each(this.renderOne,this);
            this.updateCourse();
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
            hlApp.debug("<TRACE>compare was clicked.");
            var schoolId=this.$('#schoolselect option:selected').val();
            var theCourseId=this.$('#courseselect option:selected').val();
            var weeks= this.$('#weeks').val();
            if(schoolId && theCourseId)
            {
                /*var params= { data: $.param({ school: schoolId, course: theCourseId, weeks:weeks}) ,
                                success:function(col,response){
                                              hlApp.debug("<TRACE>fetched data:"+response);
                                },
                                error:function (col,response){
                                   hlApp.debug('<TRACE>fetched fail,response:'+response);
                                }
                            };

                var list=new hlApp.SchoolPriceList;
                var view=new hlApp.SchoolPriceView;
                view.$el=$(getPBName());
                view.list=list;
                view.listenEvents();

                list.fetch(params);*/

                var model=new hlApp.PriceListModel({},{schoolId:schoolId,courseId:theCourseId,weeks:weeks});

                var view= new hlApp.SchoolPriceView2;
                view.$el=$(getPBName());
                view.model=model;
                view.listenEvents();

                model.fetch();

            }
        }
    });

    var searchForm=new SearchForm;
    var priceBoardArray=["#b1","#b2","#b3","#b4"];
    var pbIndex=-1;

    getPBName=function()
    {
        if(pbIndex>=3)pbIndex=-1;
        pbIndex++;
        return priceBoardArray[pbIndex];
    }

    schoolList.fetch({reset:true});

});