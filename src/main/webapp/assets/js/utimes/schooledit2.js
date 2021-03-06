$(function(){

            var options_editSchool = {
                    beforeSubmit:  showRequest_editSchool,  // pre-submit callback
                    success:       showResponse_editSchool  // post-submit callback
                };

            // pre-submit callback
            function showRequest_editSchool(formData, jqForm, options) {
                /*var queryString = $.param(formData);
                //alert('About to submit the edit school: \n\n' + queryString);*/
                return true;
            }

            // post-submit callback
            function showResponse_editSchool(responseText, statusText, xhr, $form)  {
                //var datarow = jQuery.parseJSON(responseText);
                //var su=jQuery("#schools").jqGrid('addRowData',datarow.id,datarow);
                //if(!su) alert("Can not update");
                //alert("showResponse_editSchool was called");
                //$('#edit-school-dialog').dialog("close");
            }
            //alert("this is called.Great!");
            $('#school-edit-form').ajaxForm(options_editSchool);

            $('#since').datepicker();
            var theSince=$('#since').val();
            console.log('since:'+theSince);
            $( "#since" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
            $( "#since" ).datepicker( "setDate", theSince);


            $('#btnsaveschool').button().click(function(){
                //save it.
                var theactive=$('#tabs','#RightPane').tabs('option','active');
                console.log('got:'+theactive);
                $('#school-edit-form').submit();
                $("#tabs div[aria-hidden='false']").load('schools.htm');
            });
            $('#btncancelsave').button().click(function(){$("#tabs div[aria-hidden='false']").load('schools.htm');});

            $('#area').on('collapse','.grid-row',function(event)
                        {
                            console.log('area collapse was triggered:'+$(this));
                            openpnls=$(this);
                            openpnls.find('.data-row').css('display','block');
                            openpnls.find('.panel').css('display','none');
                            openpnls.find('.panel').html('');
                            openpnls.removeClass('panel-open');
                        }
            );

            $('#area').on('toggleEdit','.grid-row',function()
                {

                    var that=$(this);
                    that.addClass("panel-open");
                    var pnl=that.find('.panel');
                    var row_idx=that.find('.row-index').text();

                    var area_name=that.find('div[data-fieldname="name"]').text();
                    var area_location=that.find('div[data-fieldname="location"]').text();
                    var area_memo=that.find('div[data-fieldname="memo"]').text();

                    console.log('area_name:'+area_name);
                    console.log('area_location:'+area_location);
                    console.log('area_memo:'+area_memo);

                    pnl.load('schoolarea.htm?action=loadpanel',function(){
                        console.log("area_edit is loaded.");
                        pnl.find('#area_name').val(area_name);
                        pnl.find('#area_location').val(area_location);
                        pnl.find('#area_memo').val(area_memo);
                        pnl.find('.row-index').text(row_idx);
                    });

                    console.log('area_edit is loading...');

                    pnl.css('display','block');
                    that.find('.data-row').css('display','none');
                }
            );

            $('#area').on('click','.grid-row',function(event)
            {
                console.log('area .grid-row was clicked');
                var that=$(event.target);

                if(that.is('.data-row'))
                {
                    var gridrow=that.parents('.grid-row');

                    if(gridrow.hasClass('panel-open'))return;

                    $('#area .panel-open').trigger('collapse',$('#area .panel-open'));
                    gridrow.trigger('toggleEdit',gridrow);
                }
                else
                {
                    var dr=that.parents('.data-row');
                    if(dr&&dr.size()>0)
                    {
                         var gridrow=that.parents('.grid-row');
                         if(gridrow.hasClass('panel-open'))return;
                         $('#area .panel-open').trigger('collapse',$('#area .panel-open'));
                         gridrow.trigger('toggleEdit',gridrow);
                    }

                }

            });

            $('#area').delegate('#area_add_row','click',
                function()
                {

                    console.log('display add panel:'+$(this));

                    var _datacount=$('#area_rows .grid-row').size();

                    $.get( "schoolarea.htm?action=new", function( data ) {
                        _thedata=data;

                        $( "#area_rows" ).append( data );
                        var _last=$('#area_rows .grid-row').last();
                        var _row_index=""+(_datacount+1);
                        _last.find('.row-index').html(_row_index);

                        var pnl=_last.children('.panel');
                        var row=_last.children('.data-row');

                        var areaid=_last.attr('data-idx');
                        pnl.addClass("panel-open");
                        pnl.load("schoolarea.htm?action=loadpanel",function(){
                            pnl.find('.row-index').text(_row_index);
                            pnl.css('display','block');
                            row.css('display','none');
                          }
                        );
                    });

                }
            );

            $('#area').delegate('.data-row','refresh',function(event,obj){
                console.log(".data-row refreshed was called!");
                var that=$(event.target);
                that.find('div[data-fieldname="name"]').text(obj.name);
                that.find('div[data-fieldname="memo"]').text(obj.memo);
                that.find('div[data-fieldname="location"]').text(obj.location);
                console.log(".data-row refreshed, updated!");
            });

            //clicked event handler.
            $('#area').on('click','.grid-toggle-row',
                    function(event){
                                var that=$(event.target);
                                var pnl=that.parents('.panel .panel-warning');
                                var _last=that.parents('.grid-row');
                                var row=_last.children('.data-row');
                                var areaName=pnl.find('#area_name');
                                var areaLocation=pnl.find('#area_location');
                                var areaMemo=pnl.find('#area_memo');
                                var schoolId=$('#id').val();
                                var areaid=_last.attr('data-idx');


                                 $.post('schoolarea.htm?action=save',
                                        {schoolid:schoolId,
                                         id:areaid,
                                         name:areaName.val(),
                                         location:areaLocation.val(),
                                         memo:areaMemo.val()
                                         },
                                         function(data){
                                                      var obj=$.parseJSON(data);
                                                      _last.attr('data-idx',obj.id);
                                                      //todo: it is necessary to use closure to beautify the code
                                                      console.log('area added!'+data);
                                                      row.trigger('refresh',[obj]);
                                         }
                                 );
                                 pnl.css('display','none');
                                 row.css('display','block');
                            }
            );




            $('#area_rows').delegate('.grid-delete-row','click',
                        function(event)
                                {
                                 console.log('delete was clicked....');
                                 var the_utimes_area_row=$(this).parents('.grid-row');
                                 var that=$(this);

                                 if(the_utimes_area_row.size()>0)
                                 {
                                    //console.log('find:'+the_utimes_area_row.size());
                                    //console.log('is it:'+);
                                    var area_id= the_utimes_area_row.attr('data-idx');
                                    if(area_id>0)
                                    {
                                        $.get('schoolarea.htm',{action:'delete',id:area_id},
                                            function(response)
                                            {
                                                the_utimes_area_row.remove();
                                            }
                                        );
                                    }
                                    else
                                    {
                                        the_utimes_area_row.remove();
                                        //todo: recalc the sn
                                    }
                                 }
                                 event.stopPropagation();
                                }
            );



            $('#tuition_rows').on('collapse','.grid-row',function(event)
            {
                console.log('collapse was triggered:'+$(this));
                openpnls=$(this);
                openpnls.find('.data-row').css('display','block');
                openpnls.find('.panel').css('display','none');
                openpnls.find('.panel').html('');
                openpnls.removeClass('panel-open');
            }
            );

            $('#tuition_rows').on('refresh','.grid-row',function(event,dataobj)
            {
                var that=$(this);
                console.log('tuition refresh that:'+that);//+' is:'+that.html());
                that.find('div[data-fieldname="name"]').text(dataobj.name);
                that.find('div[data-fieldname="memo"]').text(dataobj.memo);
                that.find('div[data-fieldname="money"]').text(dataobj.money);
                that.find('div[data-fieldname="type"]').text(dataobj.type);
                that.find('div[data-fieldname="paytype"]').text(dataobj.payype);
                that.attr('data-idx',dataobj.id);
                console.log('================================>here');
                that.trigger('collapse');
            }
            );

            $('#tuition_rows').on('click','.grid-toggle-row',function(event){
                    var that=$(event.target);
                    console.log('tuition click that:'+that+' is:'+that.html());
                    var pnl=that.parents('.panel');
                    var thatrow=that.parents('.grid-row');
                    console.log('tuition click thatrow:'+thatrow+' size:'+thatrow.size());
                    var tuition_id=thatrow.attr('data-idx');
                    var tuition_name=pnl.find('#tuition_name').val();
                    var tuition_type=pnl.find('#tuition_type').val();
                    var tuition_paytype=pnl.find('#tuition_paytype').val();
                    var tuition_money=pnl.find('#tuition_money').val();
                    var tuition_memo=pnl.find('#tuition_memo').val();
                    var tuition_schoolid= $('#id').val();

                    $.post('schooltuition.htm?action=save',
                            {id:tuition_id,
                             name:tuition_name,
                             type:tuition_type,
                             paytype:tuition_paytype,
                             money:tuition_money,
                             memo:tuition_memo,
                             schoolid:tuition_schoolid},
                             function(data){
                                var dataobj=$.parseJSON(data);
                                console.log('return data:'+dataobj);
                                thatrow.trigger('refresh', [dataobj]);

                    });
                    event.stopPropagation();
            });

            $('#tuition_rows').on('click','.grid-delete-row',function(event){
                var that=$(this);
                console.log('tuition click that:'+that+' is:'+that.html());
                console.log('.grid-delete-row was clicked');
                var the_utimes_tuition_row=$(this).parents('.grid-row');


                 if(the_utimes_tuition_row.size()>0)
                 {
                    //console.log('find:'+the_utimes_area_row.size());
                    //console.log('is it:'+);
                    var _id= the_utimes_tuition_row.attr('data-idx');
                    console.log('_id:'+_id);
                    if(_id>0)
                    {
                        $.get('schooltuition.htm',{action:'delete',id:_id},
                            function(response)
                            {
                                the_utimes_tuition_row.remove();
                            }
                        );
                    }
                    else
                    {
                        the_utimes_tuition_row.remove();
                        //todo: recalc the sn
                    }
                 }
                 event.stopPropagation();
                console.log('stopped?FUCK!');
            });


            $('#tuition_rows').on('toggleEdit','.grid-row',function(event,target)
                {

                    var that=$(target);
                    that.addClass("panel-open");
                    var pnl=that.find('.panel');
                    var row_idx=that.find('.row-index').text();

                    var tuition_name=that.find('div[data-fieldname="name"]').text();
                    var tuition_type=that.find('div[data-fieldname="type"]').text();
                    var tuition_paytype=that.find('div[data-fieldname="paytype"]').text();
                    var tuition_money=that.find('div[data-fieldname="money"]').text();
                    console.log('the money is:"'+tuition_money+'"');
                    var tuition_memo=that.find('div[data-fieldname="memo"]').text();


                    pnl.load('school_edit.htm?action=loadtuitionpanel&rownumber='+row_idx,function(){
                        console.log("shcool_edit is loaded.");
                        pnl.find('#tuition_name').val(tuition_name);
                        pnl.find('#tuition_type').val(tuition_type);
                        pnl.find('#tuition_paytype').val(tuition_paytype);
                        pnl.find('#tuition_money').val(tuition_money.trim());
                        pnl.find('#tuition_memo').val(tuition_memo);
                        pnl.find('.row-index').text(row_idx);
                    });

                    console.log('school_edit is loading...');

                    pnl.css('display','block');
                    that.find('.data-row').css('display','none');
                }
            );

            $('#tuition_rows').on('click','.grid-row',function()
            {
                console.log('.grid-row was clicked');
                var that=$(event.target);

                if(that.is('.data-row'))
                {
                    var gridrow=that.parents('.grid-row');

                    if(gridrow.hasClass('panel-open'))return;

                    $('#tuition .panel-open').trigger('collapse',$('#tuition .panel-open'));
                    gridrow.trigger('toggleEdit',gridrow);
                }
                else
                {
                    var dr=that.parents('.data-row');
                    if(dr&&dr.size()>0)
                    {
                         var gridrow=that.parents('.grid-row');
                         if(gridrow.hasClass('panel-open'))return;
                         $('#tuition .panel-open').trigger('collapse',$('#tuition .panel-open'));
                         gridrow.trigger('toggleEdit',gridrow);
                    }

                }

            });

            $('#tuition_add_row').click(function(){

                        $('#tuition .panel-open').trigger('collapse',$('#tuition .panel-open'));

                        var cnt=$('#tuition_rows').children().size()+1;
                        $.get('school_edit.htm?action=loadtuitionrow',function(data)
                        {
                          $('#tuition_rows').append(data);
                          var newrow=$('#tuition_rows .grid-row').last();
                          newrow.rownumber=cnt;
                          newrow.find('.row-index').text(cnt);
                          newrow.trigger('toggleEdit',newrow);

                        });


                    });

      });