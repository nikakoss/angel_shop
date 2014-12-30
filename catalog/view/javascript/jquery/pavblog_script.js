(function($){$.fn.extend({nextUntil:function(expr){var match=[];this.each(function(){for(var i=this.nextSibling;i;i=i.nextSibling){if(i.nodeType!=1){continue}match.push(i)}});return this.pushStack(match)},Accordion:function(settings){settings=$.extend({},$.Accordion.defaults,{header:$(":first-child",this)[0].tagName},settings);var container=this,active=settings.active?$(settings.active,this):settings.active===false?$("<div>"):$(settings.header,this).eq(0),running=0;container.find(settings.header).not(active||"").nextUntil(settings.header).hide();active.addClass(settings.selectedClass);function clickHandler(event){var clicked=$(event.target);if(clicked.parents(settings.header).length){while(!clicked.is(settings.header)){clicked=clicked.parent()}}var clickedActive=clicked[0]==active[0];if(running||(settings.alwaysOpen&&clickedActive)||!clicked.is(settings.header)){return}active.toggleClass(settings.selectedClass);if(!clickedActive){clicked.addClass(settings.selectedClass)}var toShow=clicked.nextUntil(settings.header),toHide=active.nextUntil(settings.header),data=[clicked,active,toShow,toHide];active=clickedActive?$([]):clicked;running=toHide.size()+toShow.size();var finished=function(cancel){running=cancel?0:--running;if(running){return}container.trigger("change",data)};if(settings.animated){if(!settings.alwaysOpen&&clickedActive){toShow.slideToggle(settings.showSpeed);finished(true)}else{toHide.filter(":hidden").each(finished).end().filter(":visible").slideUp(settings.hideSpeed,finished);toShow.slideDown(settings.showSpeed,finished)}}else{if(!settings.alwaysOpen&&clickedActive){toShow.toggle()}else{toHide.hide();toShow.show()}finished(true)}return false}function activateHandlder(event,index){clickHandler({target:$(settings.header,this)[index]})}return container.bind(settings.event,clickHandler).bind("activate",activateHandlder)},activate:function(index){return this.trigger("activate",[index||0])}});$.Accordion={};$.extend($.Accordion,{defaults:{selectedClass:"selected",showSpeed:"slow",hideSpeed:"fast",alwaysOpen:true,animated:true,event:"click"},setDefaults:function(settings){$.extend($.Accordion.defaults,settings)}})})(jQuery);